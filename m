Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580188;
	b=wiWof3+53tXn3wJTgMNtxIfQ0UdGtitCq+JTT+hGdzZgGc7jrdi4Dk4A7ifBqijaVKiQ
	 kTPhHA+UXJhiu8+mhnWGifjpuPxCnYch9eIPrbL09AGMjEV9CWvo5UAdavH3GXSYkGSo+
	 hW4low9TH3GWx3d/FLGkDIJLdnydIJEsTFUu8rSizdRjyT1z5728t2LCys/Vl8aXl3UiK
	 XKRqRBIqbMGxvQ0U99amvT/EcI/7bmeka3Z7QHp5bjKUFF7iBl3Q31fdhSGPAhJ6oLH9Y
	 ilEDsWN7jPyFwTeK4hCUgLxUPvqBgekgMVF4NHrhnLaaolmFxNRZohpMfVYOvNBSpCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580188;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AxLijxCHhlhY2faPDuw/HBU0+yy89FEV9COVq1aaz44=;
	b=BqapZmmpiXuGE4BK5uy1tWfFjJV2mgSiU5CAXmUzYwj4dVroHHwY5bPYvMfVwzXAYfKg
	 pDh3yTkEetUaE4JE3Xqr7DStLVQNQWRw58DqLlHMAfni0J4Dmd8tIFJ2DvP66pv0a1D/R
	 olxIJ4ibO8DVftDhjtaaFonZZAVai9ePsJJqW5L9kHBUF93gekh3hAd7wfMG2t6Bc1OCR
	 lVVaovKWu/S20QcjIyN8kzPIkui2RY0r5CNdbhzfj5qdUlnRHDECYJQBhKcdpr12Id9QS
	 8VMmjPJ4M+Y6v3AREfio1C3q3InYRkSG213PzXY0GeIPwJ4mpA5YbfHRXGHQdwif3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA2606A32D
	for <brcm80211@lists.linux.dev>; Mon,  2 Nov 2026 00:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FA2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d290b10a35so981423eaf.2
        for <brcm80211@lists.linux.dev>; Sun, 01 Nov 2026 16:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580186; x=1794184986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxLijxCHhlhY2faPDuw/HBU0+yy89FEV9COVq1aaz44=;
        b=BqjCY4Q9Vz+628FLiMXLDuU8JGiyohiHVDnPSxFpXHqrRRy1phatLYHub5o7HNnDpE
         Xv4I23F8XfQ4D0libPx5dGagoFImkSGG2X2BP8uM4laL/F8p8ktXX4ey5yc8NRMYs9HV
         o1WDKqLThLlgJnO9NlkFNgJgQDulRVkLVk8bjt7EnqLm8iYeQhbhHGw3ZmfaExe4icGc
         4Y+Lf+ZeQ3Q6veg3wT5hZAegGWWRnuB+wUztm7i3ZP6dSbfA2fBYCHoTebcajJ0Q4DqU
         a0kMRd0lfW9tHTJ12DsHV7/w6YmCPwkn7jsXMWddDK+TKTFD+gTpDZ9hANXUhlIG4dZg
         /MkA==
X-Forwarded-Encrypted: i=1; AKwUvBxMPVp5FHsnmwVxv9BQOSh+VsUcBxKJ+Z5M15zYOExrkYH3ENQiOp+QZrOp6bfKkUXd+CVjyY2JNUU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLzRclZkVxWTcq4Ya5xhHkrr7ePIPnF7tYcJ3sAz+KhIDs33YXV
	Rm7JAVaLUqoeJHY7ZBz8FNZIUPnhrr2F7FVPlNKjBunAUnYTV08JOofPeVd2yKjB
X-Gm-Gg: AYBFou3f30NIKjsBkcapqpD5nOixBAYXqLyE96ljv87bvEt3eKvvH0nJWLgTOTKr+G9
	6NG41U4e4S8l7vUsDSCpqqV7bYX1r+j2EOKgwL3dMaawQxZBmOFypomaQT5MC5mFHXeDxR8Zqfm
	wuN54JnLCgkSj2Q+v8PuTerJ0PuEQScKyhgeCOTVl7hgI0Xl/+LVSx++MImS6P22/v/JEluafoy
	1AYMwCZSl8QqfIkbhgg0m2XpNnWrEmZoc0Eg7cvzp3Yu87SLSa9GQrsk08M4om0Dj9MuA52i76w
	S07Gq5qRDCBCWY0gMfTS5lkXfyyhvKrOQw2fCMH4ttcVAQqGM7o966tMydtsY55FPd4iGMAlO22
	kZDidnZMdvY6fStKNAc7lw75HPiQIIrqxlsMQoKXJ8YtaUXUeRhH/ZA1EI/Tg1kMHxssPUnfdWo
	wkUgrnPVxhxU3NMbEKth4ruToVWLWM4mtUHrfVN/PNCkBbUVRReR8YRopqcaCLCRU3ldYqFos/6
	xL2kuMqIqRWW8J/Kl/YOBifn402GGljYD1yTWzFQsWaEreEZgnyJaGz6xNo29agPMDT6TwnX1/0
	XqORDgOUCCrd89wsHTCkGEagmDf2xHKnYyNnepNIBzIlYpeYLuH65h2pds8agpMq5hg4qVZ319V
	Tu00aMy/MACOwISP9BtIxSvK1UsjkpNt/wcIwjz5Jw55i7I0sqrM6C1RE/WugD+iaZIIsFu8NwM
	o=
X-Received: by 2002:a05:6820:571a:20b0:6f4:8f1d:a49b with SMTP id 006d021491bc7-714f24eace8mr3259160eaf.10.1793580186456;
        Sun, 01 Nov 2026 16:43:06 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2cf11fasm7527848eaf.3.2026.11.01.16.43.05
        for <brcm80211@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 16:43:05 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8479f46ecd8so969052a34.0
        for <brcm80211@lists.linux.dev>; Sun, 01 Nov 2026 16:43:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwtlzSHwnpiipuwdD+x6KTVzZ2qY3A+DEv4NGB+YaS3vbpDfUXT70oMZp/GPURK3oASZxrlcnMHDJI=@lists.linux.dev
X-Received: by 2002:a05:6830:3e03:b0:814:b62d:3122 with SMTP id
 46e09a7af769-85d365b1f81mr6135908a34.22.1793580185285; Sun, 01 Nov 2026
 16:43:05 -0800 (PST)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 1 Nov 2026 19:42:28 -0500
X-Gmail-Original-Message-ID: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
X-Gm-Features: AclHuK_r7QD-EGzh5icdkxVPJ8YDU4Pcq4HDNCl7O8hh8I3jnfCORQFhQybBRTw
Message-ID: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Pieter-Paul Giesberts <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>, 
	Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
	Daniel Berlin <dberlin@dberlin.org>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:49=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
>
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling
>
> These changes include work by Hector Martin and Daniel Berlin from Asahi
> Linux, refactored where needed for upstream inclusion.
>
> The series provides basic station support only. 6 GHz support is planned
> for a follow-up patchset after this lands. The driver retains legacy
> interfaces for older firmware.
>
> Tested on an Apple M3 MacBook Air (J613):
> - Device boot and network scanning
> - 5 GHz WPA2-PSK association and DHCP
> - Bidirectional TCP traffic
>
> Testing required separate Apple PCIe and devicetree patches, as well as
> Janne Grunau's port-authorization fix [1].
>
> [1] https://lore.kernel.org/linux-wireless/20260915-brcmfmac-4way-handsha=
ke-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net/
>
> ---
> Daniel Berlin (1):
>       wifi: brcmfmac: Support versioned scan parameter layouts
>
> Hector Martin (6):
>       wifi: brcmfmac: Support newer PCIe core startup and interrupts
>       wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
>       wifi: brcmfmac: Load signed PCIe firmware images
>       wifi: brcmfmac: Accept newer BSS information versions
>       wifi: brcmfmac: Support versioned join requests
>       wifi: brcmfmac: Add BCM4388 support
>
> Michael Reeves (6):
>       wifi: brcmfmac: pcie: Report the detected chip ID to the bus
>       wifi: brcmfmac: Match complete firmware capability names
>       wifi: brcmfmac: Fall back to RSSI-only default join preferences
>       wifi: brcmfmac: Use event_msgs_ext for event masks
>       wifi: brcmfmac: Handle larger firmware band lists
>       wifi: brcmfmac: Handle extended PMK command payloads
>
>  .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>  .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |   9 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 368 +++++++-------
>  .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  36 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  27 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  18 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 124 ++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 141 +++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |  65 ++-
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |   9 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 560 +++++++++++++++=
++----
>  .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>  .../broadcom/brcm80211/include/brcm_hw_ids.h       |   2 +
>  .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>  19 files changed, 1593 insertions(+), 339 deletions(-)
> ---
> base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
> change-id: 20260925-brcm4388-submit-5cb8d3e6d6a5
>

Works for me and looks good.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
