ARG BASE_IMAGE=rentready/android-sdk:tools
FROM ${BASE_IMAGE}

ARG ANDROID_PLATFORM_VERSION
ARG ANDROID_BUILD_TOOLS_VERSION

RUN yes | sdkmanager --install \
    "platforms;android-${ANDROID_PLATFORM_VERSION}" \
    "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platform-tools" \
    "tools"