# Import the python image with version
FROM python:3.12-slim

# Prevent python from creating pyc file and buffering logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Mention work directory
WORKDIR /app

# Import requirements file
COPY requirements-docker.txt .

#Install dependencies
RUN pip install --no-cache-dir -r requirements-docker.txt

# Copy project files
COPY . .

# Expose port 
EXPOSE 8000

# Default command to run
CMD python manage.py collectstatic --noinput && \
    python manage.py runserver 0.0.0.0:8000
