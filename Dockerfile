# Getting the python 3.9 image
# Optimization: can consider using a smaller more restricted image
FROM python:3.9-slim

# Copying my app to the image
WORKDIR /usr/src/backend
COPY requirements.txt ./

# Install production dependencies form the requirements.txt file
RUN pip install -r requirements.txt
COPY . .

# Startup command to serve our app
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "--workers", "2", "--threads", "8", "main:app"]
