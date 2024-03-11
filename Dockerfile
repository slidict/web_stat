FROM slidict/docker-rails:bullseye-node20.11.1-npm10.5.0-ruby3.3.0-bundler-2.5.6_upgraded

# Set locale
ENV LANG "C.UTF-8"
ENV NOKOGIRI_USE_SYSTEM_LIBRARIES "YES"

# Set correct environment variables.
RUN mkdir -p /var/www/docker
WORKDIR /var/www/docker

# Set up application
COPY . .

# Init gems
RUN echo "gem: --no-rdoc --no-ri" > ~/.gemrc
RUN bundle config --global system true && \
  bundle config --global jobs 10 && \
  bundle config --global build.nokogiri --use-system-libraries && \
  bundle install

CMD ["bash"]
