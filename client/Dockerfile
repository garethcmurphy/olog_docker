
FROM python:3

COPY logbook-0.5-beta/ /logbook-0.5-beta/
RUN ls -Rla /logbook-0.5-beta/*

WORKDIR  /logbook-0.5-beta/Olog/public_html/
CMD python3 -m http.server 8000
