# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt and install Python packages
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# Don’t copy project files — they’ll come from a mounted volume


# Default command (can be changed as needed)
CMD ["bash"]
