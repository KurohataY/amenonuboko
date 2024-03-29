FROM python:latest

WORKDIR /related_title_searcher

RUN apt update && apt upgrade -y && apt install -y \
  sudo \
  wget \
  vim \
  mecab \
  libmecab-dev \
  mecab-ipadic-utf8 \
  git \
  make \
  curl \
  xz-utils \
  file

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN pip install uvicorn torch torchaudio torchvision SQLAlchemy python-dotenv PyMySQL ipadic fugashi fastapi-utils fastapi transformers pandas gensim beautifulsoup4 scipy sudachipy sudachidict_full

ENV HOST 0.0.0.0

# CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "6000"]