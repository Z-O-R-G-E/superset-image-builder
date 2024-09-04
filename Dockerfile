######################################################################
# базовый образ
######################################################################
ARG BUILD_PLATFORM
ARG IMAGE_TAG
ARG IMAGE_NAME
FROM --platform=${BUILD_PLATFORM} ${IMAGE_NAME}:${IMAGE_TAG} AS superset-official

######################################################################
# Node - этап работы со статическим созданием активов
######################################################################
ARG BUILD_PLATFORM
FROM --platform=${BUILD_PLATFORM} node:16-slim AS superset-node

ARG NPM_BUILD_CMD="build"
ENV BUILD_CMD=${NPM_BUILD_CMD} \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Сначала NPM ci, чтобы НЕ аннулировать предыдущие шаги, за исключением случаев изменения package.json.
#RUN mkdir -p /app/superset-frontend

# Устанавливаем рабочую директорию
#WORKDIR /app/superset-frontend/

# Копируем в образ файлы package*.json
#COPY superset_3_0_0/superset-frontend/package*.json ./
#RUN npm ci

# Копируем всю директорию superset-frontend для пересборки
#COPY superset_3_0_0/superset-frontend .

# Тяжеловесный шаг - билдим и удаляем node_modules
#RUN npm run ${BUILD_CMD} \
#    && rm -rf node_modules

######################################################################
# Окончательный образ
######################################################################
FROM superset-official AS superset-bi

# Копируем статические ресурсы (assets) из каталога /app/superset/static/assets
# в образ Docker, используемый для запуска веб-приложения Superset
#COPY --from=superset-node /app/superset/static/assets /app/superset/static/assets

######################################################################
# Устанавливаем драйвера указанные в requirements
######################################################################
USER root

#COPY superset_3_0_0/requirements/requirements-local.txt /app/requirements/

# Кэшируем все для процесса разработки...
#RUN cd /app \
#    && pip install --no-cache -r requirements/requirements-local.txt

USER superset