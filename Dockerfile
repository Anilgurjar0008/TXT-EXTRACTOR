# Python आधारित lightweight image
FROM python:3.11-slim

# System packages इंस्टॉल करें (git, ffmpeg आदि)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        ffmpeg \
        aria2 && \
    rm -rf /var/lib/apt/lists/*  # Cache साफ़ करें

# Pip को अपडेट करें
RUN pip3 install --no-cache-dir -U pip

# Requirements फ़ाइल कॉपी करें
COPY requirements.txt /requirements.txt

# Python dependencies इंस्टॉल करें
RUN pip3 install --no-cache-dir -U -r requirements.txt

# App का फोल्डर बनाएँ
RUN mkdir -p /EXTRACTOR
WORKDIR /EXTRACTOR

# Start script कॉपी करें और executable बनाएँ
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Container start होने पर script चलाएँ
CMD ["/start.sh"]
