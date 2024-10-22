

### (from run write command) 
### make <command name>  
### ( example: make lint)

## List command name


all: lint format run_dev_mobile

info:
	@echo "╠ Start get info..."
	@dart info

gen: ## Generates the assets
	@echo "╠ Generating the assets..."
	@flutter packages pub run build_runner build
	@flutter gen-l10n
	@flutter pub run intl_utils:generate

## dart run build_runner build --delete-conflicting-outputs
buildrunner: ## Build the files for changes
	@echo "╠ Building the project..."
	@flutter pub run build_runner build --delete-conflicting-outputs
	

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@flutter pub run import_sorter:main
	@flutter format lib

check:
	@echo "╠ Check code..."
	@flutter --version
	@flutter pub get
	@flutter analyze .
	@dart format --set-exit-if-changed .
	@flutter test --coverage

## * The dart pub outdated command helps find outdated dependencies, which is also useful for keeping your project clean.
## * The dart analyze command helps find errors and warnings in your code, including unused variables and methods.
code_clean: 
	@dart pub outdated 
	@dart analyze
	@dart pub run dart_code_metrics:metrics lib --reporter=html

# dart analyze --fatal-infos
stylecode:
	@echo "╠ Style code code..."
	@dart analyze . || (echo "Error in project"; exit 1)
	@dart fix --dry-run || (echo "Error in project"; exit 2)
	@dart fix --apply || (echo "Error in project"; exit 3)
	@dart format . || (echo "Error in project"; exit 5)
	

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "Error in project"; exit 1)

unit: ## Runs unit tests
	@echo "╠ Running the tests"
	@flutter test || (echo "Error while running tests"; exit 1)

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean
	@flutter pub get

docs:
	@echo "╠ Create docs project..."
	@dart doc .
# dart doc --output=api_docs .
# dart doc --dry-run .

settingproject:
	@echo "╠ Settings project..."
	@dart format config --line-length=80

# $ dart pub run dart_code_metrics:metrics lib
# # or for a Flutter package
# $ flutter pub run dart_code_metrics:metrics lib
# ====
# $ dart pub run dart_code_metrics:metrics lib --reporter=html
# # or for a Flutter package
# $ flutter pub run dart_code_metrics:metrics lib --reporter=html

ios:
	flutter build ipa

android:
	flutter build appbundle --no-shrink
