package otp2fa

import (
	"os"

	"github.com/joho/godotenv"
)

var (
	TOTP_APP_ENV                 string
	TOTP_APP_RATE_COUNT          string
	TOTP_APP_DATABASE_FILENAME   string
	TOTP_APP_QRCODE_FOLDER       string
	TOTP_APP_DATABASE_FOLDER     string
	TOTP_APP_REGEX_WORD_FILENAME string
	TOTP_APP_DELIM_WORD_FILENAME string
)

func init() {
	envLookup, found := os.LookupEnv("TOTP_APP_ENV_PATH_GLOBAL")
	if !found {
		envLookup = "env/global.env"
	}
	_ = godotenv.Load(envLookup)

	TOTP_APP_ENV = os.Getenv("TOTP_APP_ENV")
	TOTP_APP_RATE_COUNT = os.Getenv("TOTP_APP_RATE_COUNT")
	TOTP_APP_DATABASE_FILENAME = os.Getenv("TOTP_APP_DATABASE_FILENAME")
	TOTP_APP_QRCODE_FOLDER = os.Getenv("TOTP_APP_QRCODE_FOLDER")
	TOTP_APP_DATABASE_FOLDER = os.Getenv("TOTP_APP_DATABASE_FOLDER")
	TOTP_APP_REGEX_WORD_FILENAME = os.Getenv("TOTP_APP_REGEX_WORD_FILENAME")
	TOTP_APP_DELIM_WORD_FILENAME = os.Getenv("TOTP_APP_DELIM_WORD_FILENAME")
}
