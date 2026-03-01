package main

import (
	"fmt"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/log"
)

func main() {

	cfg := initEnvironment()
	app := fiber.New(fiber.Config{
		AppName:     cfg.App.Name,
		ReadTimeout: 30 * time.Second,
	})

	app.Get("/", func(c *fiber.Ctx) error {
		return c.Send([]byte("Hello World"))
	})

	log.Fatal(app.Listen(fmt.Sprintf(":%d", cfg.App.Port)))

}
