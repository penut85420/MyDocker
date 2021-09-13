#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "CUnit/Basic.h"
#include "CUnit/CUCurses.h"

int *BIG = NULL;

int init_suite1(void)
{
  BIG = (int*) malloc (sizeof(int) * 10);
  for (int i = 0; i < 10; i++)
    BIG[i] = i * i;
  return 0;
}

int clean_suite1(void)
{
  free(BIG);
  return 0;
}

int hello(int x)
{
  if (x >= 10) return -1;
  int sum = 0;
  for (int i = 0; i <= x; i++)
    sum += BIG[i];
  return sum;
}

void testHello(void)
{
  for (int i = 0; i < 10; i++)
    CU_ASSERT(hello(i) == i * (i+1) * (2*i+1) / 6);
  for (int i = 10; i < 20; i++)
    CU_ASSERT(hello(i) == -1);
}

int main()
{
   CU_pSuite pSuite = NULL;

   if (CUE_SUCCESS != CU_initialize_registry())
      return CU_get_error();

   pSuite = CU_add_suite("Suite_1", init_suite1, clean_suite1);
   if (NULL == pSuite) {
      CU_cleanup_registry();
      return CU_get_error();
   }

   if (NULL == CU_add_test(pSuite, "test of hello()", testHello))
   {
      CU_cleanup_registry();
      return CU_get_error();
   }

   CU_basic_set_mode(CU_BRM_VERBOSE);
   // CU_basic_run_tests();
   CU_curses_run_tests();
   CU_cleanup_registry();
   return CU_get_error();
}