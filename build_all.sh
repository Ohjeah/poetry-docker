IMAGE_NAME=mquade/poetry

for IMAGE_BASE in python mquade/python; do
  echo "Building for base image ${IMAGE_BASE}."
  for PYTHON_VERSION in 3.7 3.8; do
    echo "..Building for Python version ${PYTHON_VERSION}."
    for POETRY_VERSION in 0.12.17 1.0.0b6 1.0.0b7; do
      echo "....Building for Poetry version ${POETRY_VERSION}."
      IMAGE=$IMAGE_BASE:${PYTHON_VERSION}-slim

      TAG=${IMAGE_NAME}:${PYTHON_VERSION}-${POETRY_VERSION}
      if [ "$IMAGE_BASE" == "mquade/python" ]; then
        TAG=${TAG}-dev
      fi

      docker build --build-arg IMAGE=$IMAGE --build-arg POETRY_VERSION=$POETRY_VERSION -t $TAG .
      docker tag $TAG $IMAGE_NAME:latest

      docker push $TAG
    done
  done
done
