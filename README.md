<p align="center">
  <img src="https://raw.githubusercontent.com/luyadev/luya/master/docs/logo/luya-logo-0.2x.png" alt="LUYA Logo"/>
</p>

# LUYA DOCKER CLI

## Run commands inside application

```sh
docker run --rm -v $(pwd):/app luyadev/luya-docker-php-cli health
```

Where `health` is the command to run in LUYA. 

 ## Use docker-compose
 
 When working with custom images, it might be helpfull to have a cli tool to run the LUYA commands, therfore add the luya cli docker image to your services list.
 
```yaml
luya_cli:
  image: luyadev/luya-docker-php-cli
    volumes: 
      - ./:/app
```

In order to run commands use `docker-compose run luya_cli <COMMAND>`.
