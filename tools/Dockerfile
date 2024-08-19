FROM --platform=${BUILDPLATFORM} ubuntu:22.04

# https://developer.android.com/studio/#command-tools
# https://developer.android.com/studio/index.html#downloads
ARG ANDROID_SDK_TOOLS_VERSION
ENV ANDROID_SDK_TOOLS_VERSION=${ANDROID_SDK_TOOLS_VERSION:-11076708}

ENV ANDROID_SDK_PACKAGE=commandlinetools-linux-${ANDROID_SDK_TOOLS_VERSION}_latest.zip
ENV ANDROID_SDK_DOWNLOAD_BASE_URL=https://dl.google.com/android/repository/${ANDROID_SDK_PACKAGE}

ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=${ANDROID_HOME}
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/${ANDROID_SDK_TOOLS_VERSION}/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_SDK_HOME}/platform-tools

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        sudo \
        bash \
        ca-certificates \
        gnupg \
        lsb-release \
        curl \
        git \
        zip \
        unzip \
        locales \
        openjdk-17-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US "en_US.UTF-8" \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
    && update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN set -x \
    && curl -fL -o /tmp/${ANDROID_SDK_PACKAGE} ${ANDROID_SDK_DOWNLOAD_BASE_URL} \
    && mkdir -p ${ANDROID_HOME}/cmdline-tools/ \
    && unzip -q /tmp/${ANDROID_SDK_PACKAGE} -d ${ANDROID_HOME}/cmdline-tools \
    && mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/${ANDROID_SDK_TOOLS_VERSION} \
    && rm -rf /tmp/*

RUN yes | sdkmanager --licenses \
    && sdkmanager --version