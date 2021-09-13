FROM tensorflow/tensorflow:2.2.1-gpu-py3-jupyter
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN pip3 install transformers penut scikit-learn pandas numpy matplotlib nltk jupyterthemes fasttext loguru gensim penut_utils stanza
RUN jt -t oceans16 -f ubuntu -tf ubuntu -nf ubuntu -ofs 12 -fs 12 -nfs 12 -tfs 12 -T -N -kl -cellw 75%
ADD jupyter_notebook_config.py /root/.jupyter/
RUN cp -r /root/.jupyter /
WORKDIR /home
