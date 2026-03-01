package main

import (
	"log"

	"github.com/caarlos0/env/v10"
	"github.com/joho/godotenv"
)

type appConfig struct {
	Env  string `env:"ENVIRONMENT" envDefault:"development"`
	Name string `env:"APP_NAME" envDefault:"assignment"`
	Port uint   `env:"PORT" envDefault:"3000"`
}

type config struct {
	App appConfig
}

func initEnvironment() config {
	log.SetFlags(log.Flags() &^ (log.Ldate | log.Ltime))

	err := godotenv.Load()
	if err != nil {
		log.Printf("Failed loading .env file: %s", err)
	}

	var cfg config
	err = env.Parse(&cfg)
	if err != nil {
		log.Fatalf("Error parse env to struct: %s", err)
	}

	return cfg
}
