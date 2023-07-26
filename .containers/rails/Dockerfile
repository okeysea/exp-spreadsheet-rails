ARG RUBY_VERSION=3.2.2
FROM ruby:${RUBY_VERSION}-slim

COPY .containers/rails/docker-entrypoint.sh /usr/local/bin/

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    --mount=type=tmpfs,target=/var/log \
    rm -f /etc/apt/apt.conf.d/docker-clean; \
    echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache; \
    apt-get update -qq \
    && apt-get install -yq --no-install-recommends \
        build-essential \
        gnupg2 \
        less \
        git \
        libpq-dev \
        postgresql-client \
        libvips \
        curl \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

RUN gem update --system && gem install bundle

WORKDIR /usr/src/app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
