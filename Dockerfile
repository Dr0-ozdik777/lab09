FROM ubuntu:22.04

# Установка зависимостей с очисткой кеша
RUN apt update && apt install -yy \
    gcc \
    g++ \
    cmake \
    git \
    make && \
    rm -rf /var/lib/apt/lists/*

# Копирование исходников
COPY . /print
WORKDIR /print

# Сборка проекта (с отключением тестов если нужно)
RUN cmake -H. -B_build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=_install \
    -DBUILD_TESTS=OFF && \
    cmake --build _build && \
    cmake --build _build --target install

# Настройка логирования
RUN mkdir -p /home/logs
ENV LOG_PATH=/home/logs/log.txt
VOLUME /home/logs

# Точка входа
WORKDIR /print/_install/bin
ENTRYPOINT ["./demo", "--console"]
