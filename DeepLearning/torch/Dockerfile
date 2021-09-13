FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
ENV HOME=/home
RUN /opt/conda/bin/python -m pip install --upgrade pip
RUN apt-get update && apt-get install -y gcc g++
RUN pip3 install transformers==3.5.1 penut scikit-learn pandas numpy matplotlib nltk jupyter jupyterthemes fasttext loguru gensim stanza pyyaml keras simpletransformers
RUN jt -t oceans16 -f ubuntu -tf ubuntu -nf ubuntu -ofs 12 -fs 12 -nfs 12 -tfs 12 -T -N -kl -cellw 75%
ADD jupyter_notebook_config.py /home/.jupyter/
RUN cp -r /home/.jupyter /
WORKDIR /home
RUN chmod -R 777 /home
CMD bash -c "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/workspace --ip 0.0.0.0 --no-browser --allow-root"
