FROM redmine:6.0.5

RUN apt-get update && apt-get install -y \
    tzdata \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY ./plugins/view_customize/ /usr/src/redmine/plugins/view_customize
COPY ./config/database.yml /usr/src/redmine/config/database.yml
ENV TZ=Asia/Tokyo\
    REDMINE_PLUGINS_MIGRATE=true

RUN chown -R redmine:redmine ./

WORKDIR /usr/src/redmine

RUN bundle install