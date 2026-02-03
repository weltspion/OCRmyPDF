<?xml version="1.0"?>
<Container version="2">
  <Name>OCRmyPDF</Name>
  <Repository>jbarlow83/ocrmypdf:latest</Repository>
  <Registry>https://hub.docker.com/r/jbarlow83/ocrmypdf</Registry>
  <Network>bridge</Network>
  <MyIP/>
  <Shell>sh</Shell>
  <Privileged>false</Privileged>
  <Support>https://github.com/jbarlow83/OCRmyPDF</Support>
  <Project>https://github.com/jbarlow83/OCRmyPDF</Project>
  <Overview>OCRmyPDF adds an OCR text layer to scanned PDFs, making them searchable. This template includes a watch-folder service that automatically processes PDFs placed in the watch directory.</Overview>
  <Category>Productivity</Category>
  <WebUI/>
  <TemplateURL/>
  <Icon>https://raw.githubusercontent.com/weltspion/OCRmyPDF/main/icon.png</Icon>
  <ExtraParams>--restart unless-stopped --hostname ocrmypdf --entrypoint /bin/sh</ExtraParams>
  <PostArgs>/config/watch.sh</PostArgs>
  
  <!-- Variables -->
  <Config Name="Watch Directory" Target="WATCH_DIR" Default="/watch" Mode="" Description="Directory to watch for incoming PDFs (container path)" Type="Variable" Display="always" Required="false" Mask="false">/watch</Config>
  
  <Config Name="Output Directory" Target="OUTPUT_DIR" Default="/output" Mode="" Description="Directory for processed PDFs (container path)" Type="Variable" Display="always" Required="false" Mask="false">/output</Config>
  
  <Config Name="Language" Target="language" Default="deu+eng" Mode="" Description="OCR language(s) - e.g., deu+eng for German and English, eng for English only" Type="Variable" Display="always" Required="false" Mask="false">deu+eng</Config>
  
  <Config Name="Update Interval" Target="update_interval" Default="10" Mode="" Description="Update interval in seconds - how often to check for new PDFs" Type="Variable" Display="always" Required="false" Mask="false">10</Config>
  
  <!-- Paths -->
  <Config Name="Config" Target="/config" Default="" Mode="rw" Description="Configuration directory for watch script" Type="Path" Display="always" Required="false" Mask="false">/mnt/user/appdata/OCRmyPDF</Config>
  
  <Config Name="Watch" Target="/watch" Default="" Mode="rw" Description="Watch directory - place PDFs here for automatic processing" Type="Path" Display="always" Required="true" Mask="false"/>
  
  <Config Name="Output" Target="/output" Default="" Mode="rw" Description="Output directory - processed PDFs will appear here" Type="Path" Display="always" Required="true" Mask="false"/>
</Container>
