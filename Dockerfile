FROM elixir:1.14.0

RUN git clone https://github.com/livebook-dev/livebook.git 
WORKDIR livebook
RUN git checkout tags/v0.6.3
RUN mix local.hex --force && \
    mix local.rebar --force
RUN mix deps.get --only prod

# Run the Livebook server
ENV MIX_ENV=prod 
RUN mix
CMD ["mix", "phx.server"]
