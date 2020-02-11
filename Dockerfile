# Secure and Minimal image of Flexlicense server.
# https://hub.docker.com/repository/docker/huggla/sam-flexlicense

# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_VERSION="2.0.0"
ARG IMAGETYPE="application"
ARG ALPINE_GLIBC_VERSION="2.30-r0"
ARG DOWNLOADS="https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$ALPINE_GLIBC_VERSION/glibc-$ALPINE_GLIBC_VERSION.apk https://downloads.safe.com/fme/floatingLicense/fme-flexnet-linux-x64.tar.gz"
ARG BUILDCMDS=\
"   cp -a sgerrand.rsa.pub /etc/apk/keys/ "\
"&& apk --repositories-file /etc/apk/repositories --keys-dir /etc/apk/keys --no-cache --initramfs-diskless-boot --clean-protected --root /finalfs add glibc-$ALPINE_GLIBC_VERSION.apk "\
"&& cp -a FlexServer*/lmgrd /finalfs/usr/bin/"
ARG STARTUPEXECUTABLES="/usr/bin/lmgrd"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base}} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-build} as build
FROM ${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================


# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>
