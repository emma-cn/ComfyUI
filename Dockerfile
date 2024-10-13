# 使用官方 Python 3.10 slim 基础镜像
FROM python:3.10-slim

# 设置工作目录
WORKDIR /home/ComfyUI

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libgl1-mesa-glx \
    libglib2.0-0 \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 升级 pip
RUN pip install --no-cache-dir --upgrade pip

# 安装 PyYAML 依赖
RUN pip install --no-cache-dir PyYAML

# 暴露端口 8188
EXPOSE 8188

# 容器启动时运行的命令
CMD pip install --no-cache-dir -r /home/ComfyUI/requirements.txt && \
    python main.py --listen 0.0.0.0 --port 8188
