FROM golang:alpine3.17

RUN apk add curl wget git vim

# Install Go Packages
RUN go install github.com/projectdiscovery/pdtm/cmd/pdtm@latest
RUN go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-server@latest
RUN go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
RUN go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest
RUN go install github.com/tomnomnom/anew@latest
RUN go install github.com/tomnomnom/httprobe@latest
RUN go install github.com/tomnomnom/gron@latest
RUN go install github.com/tomnomnom/waybackurls@latest
RUN go install github.com/003random/getJS@latest
RUN go install github.com/tillson/git-hound@latest
RUN go install github.com/hahwul/dalfox@latest
RUN go install github.com/ffuf/ffuf/v2@latest
RUN GO111MODULE=on go install dw1.io/go-dork@latest
RUN GO111MODULE=on go install github.com/jaeles-project/gospider@latest

ENV PATH=$PATH:/root/.pdtm/go/bin:/root/go/bin

# Additional Installations
RUN pdtm -ia

# Custom Changes
RUN apk add vim zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
