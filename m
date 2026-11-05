Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915094;
	b=JLaO2AESej7e1SlHwoDpmeheDjTzIrkNqQwjx072dteM22ZmRDNnq5bfZB6Cp4kcgcPf
	 7FT2LnXizFt56gBuDIEBy+cXIVZ2WWVM+ysppq9NxhquFPztFWqev1OFcLG4gbnEgxuRd
	 mCzeujPvzRrwYgntly/xD5ZtzX2DHlutmoM7E13BFknvIV/Hi3c2U0C05nuFWTqy48Z8s
	 pb94hhAYSwjEpT6MXYKuMh+aZNLtqysx1auCD4rE14ymMCwJd554613msLbHexpKD2q15
	 E3g4pbAipA6WTCSkWQrxOcqxU+M2J58lNzjijdFySjY1TZ0iowPq6guDDtRadktS3eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915094;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oHIzt9l6ZqX1+4fgIF4dpM8hMXfpU4Wy6+rPpNQD3cg=;
	b=F7NS5JNBIFPmc4rju2ZqMHhMIsE+QzNEdErYLALdGzCUgIJ0kPhnXt4Y/iI8XnMXGHBh
	 Iy/Q6jF/F/V5aKsqD1DeNmdkid40aY1SKN7XhjkIiOe5YOpupA4dEmjgaHWlaFjoPMK0Z
	 u8aBX2ugcgGPzipay/ZTsPnqOvTBdYRzzvRMrTk9zBd0/KsIYVA0aXftMgecBxqjVD1cs
	 TMvlI36+JaoNLtXdUy/6PGF60FiPRFbRY14LIx/vBOt/oqwu0Qb3pmyCJgXHDMpR09HZy
	 X2hM0dDpWXoS0ejAb81iO6I16hBHBOlReqJbGo9pSgAPZovXnFrOBEyomC5cHVmHaIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDCC606A330
	for <brcm80211@lists.linux.dev>; Thu,  5 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDCC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so38942eaf.2
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 13:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915093; x=1794519893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHIzt9l6ZqX1+4fgIF4dpM8hMXfpU4Wy6+rPpNQD3cg=;
        b=Xnorqwj4pMeiM3m6viIHZj9foSz1WXzkHRKuvrsFQMcLH/M4cDR/IfnJ8Grq9MCc+M
         zsPqsUX7AiS5p6VQ4FYZN4+A5v+xlkSqZeoNOWIkrAOlZNrX3Z0LV43dgWGFfl7CFAWU
         ZTz5ELrbHfcdCZaiqJZB0hN3Yof6aYf/0GDCRkRcR9UH0xRtmGGtgcONKMwOuCTSX+cz
         NfBrb/g8XQfYdVpwKB1b6OXYe1QEom/Hy46jnMFTGwgsEc8PI7P+v5jSp4XtwLDYLv04
         rbytLy7Yr2G+2/wVkMAfWSIZP8CvfNFTq7z4RoStHD8Io5+/szwa85Awvmxjlv5cog0t
         iQcg==
X-Forwarded-Encrypted: i=1; AKwUvBxxhRDKu17t19m9L5ys+xd10GH3XD2xXf+p0K70YVkeoNxh8UpVf9TSZvennc+H9svamKQp5wFSlj4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/GV7SlbrAgcNCTDKRVbc60NcfjJpepV/N1oi0s+C6ZDfEYiOta
	vRg6MwC6gBA4PKJwyY+Ffb+PffQDSIFHPwXMzMjBOcjqu64MbfNIXnkaEOk6jolD
X-Gm-Gg: AYBFou2KrTDATyfMMOEcuVc67v6/XIgIvjDCbaGLUBqRsPlpKldOB/zh1ozsJP/GpHC
	Ylc0npTmANaVPTMW54LMVJnj1KnTNZpnJQkcD9JyrafVF/D5tNt1rWwZIAngt9dzb3D5YzEIfw5
	cnuaAUt82qSoUtaOLMtcZZIsjHTN5sHAChALLM9asGkRaiOSHKM9WMlTdk4XN3Iw4wl7H93dU0f
	qynXxkidIr72IEKBTf7grLGfXoWKMEbvD6YjwAsilU6MsgNtDqs1Ro+5Li1qXl7/MBa8T8E9x4S
	tK2oo8fpOY346Kyu1L6Bi42tUB6VX2jKtIip0OZ+3ZQORazh19zOMve6TxYaoplP51kqoaGZOwA
	uC8DX6CX960Lfug2jXxseKllGlskR/LZ4obZaotiWM8901EpmK+IMqZZaLd5ighfPWRIv8nLMMt
	djaetC1E4Q5/Q15G9N0HnrlXVDIFiMby8H9dE9DpwK/CkCegoJSlgWfE9OpoaEDmDeeSeZgeLsj
	vmwbwUWcjcZir5wXtFtI+PYsyY+X9KV3kZ5BnktWX9CU+OHkv1bnGQjlVDJxlEtHAv9vG10w4dK
	twPLOMZblAHmY4Q60d9QgtEei12NgQiVtmSs/Pm7MI6u4C8BSzL9edrLlT1WXlk5On3rcIRxlPV
	KDvbOYiAkCbSwOm/bQS0FswnsGpOQl5iaRrA4RfJxmqKtnv5GC6vPyDFsPid61i11eJAoE5iyZz
	g=
X-Received: by 2002:a05:6820:7048:b0:716:d143:46af with SMTP id 006d021491bc7-716e79ed3ebmr483825eaf.64.1793915092745;
        Thu, 05 Nov 2026 13:44:52 -0800 (PST)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad973fc15dsm425317fac.1.2026.11.05.13.44.51
        for <brcm80211@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:44:52 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-70b875f6f13so60310eaf.0
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 13:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx2nX9kZB/Pn+fu80mBbLY4/bjkbCVvXn8uA5BcD3bZdddP5jorfeucIk9DgBg6mJz1kmWubz2dD/s=@lists.linux.dev
X-Received: by 2002:a05:6820:4d48:b0:70b:8831:8c5e with SMTP id
 006d021491bc7-716e79aa3abmr562272eaf.51.1793915091517; Thu, 05 Nov 2026
 13:44:51 -0800 (PST)
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
 <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com> <1a19d3270b8.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1a19d3270b8.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 5 Nov 2026 16:44:14 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_xkZ1oGsg=uPtCT-Eh8_-TuLEwxEx02BfLiOB2bZyg-Q@mail.gmail.com>
X-Gm-Features: AclHuK92anjNPVWCBzaMzrlLgp2aPs-ERNpv9JXE7UUqwrJIWMbDdlGrpwi1rH4
Message-ID: <CAEg-Je_xkZ1oGsg=uPtCT-Eh8_-TuLEwxEx02BfLiOB2bZyg-Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: michael.reeves077@gmail.com, Pieter-Paul Giesberts <pieterpg@broadcom.com>, 
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>, Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
	Daniel Berlin <dberlin@dberlin.org>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:58=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> Op 2 november 2026 01:43:07 schreef Neal Gompa <neal@gompa.dev>:
>
> > On Fri, Sep 25, 2026 at 9:49=E2=80=AFAM Michael Reeves via B4 Relay
> > <devnull+michael.reeves077.gmail.com@kernel.org> wrote:
> >>
> >> The Broadcom BCM4388 chipset requires new PCIe initialization and
> >> firmware interfaces. Add support for these interfaces to brcmfmac to
> >> enable basic station operation.
> >>
> >> This series adds:
> >> - Signed firmware loading and mailbox transport
> >> - Fixes for chip identification and firmware capability matching
> >> - Versioned scan and join requests, and extended PMK payloads
> >> - Updated event mask handling
> >>
> >> These changes include work by Hector Martin and Daniel Berlin from Asa=
hi
> >> Linux, refactored where needed for upstream inclusion.
> >>
> >> The series provides basic station support only. 6 GHz support is plann=
ed
> >> for a follow-up patchset after this lands. The driver retains legacy
> >> interfaces for older firmware.
> >>
> >> Tested on an Apple M3 MacBook Air (J613):
> >> - Device boot and network scanning
> >> - 5 GHz WPA2-PSK association and DHCP
> >> - Bidirectional TCP traffic
> >>
> >> Testing required separate Apple PCIe and devicetree patches, as well a=
s
> >> Janne Grunau's port-authorization fix [1].
> >>
> >> [1]
> >> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-4way-handshak=
e-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net/
> >>
> >> ---
> >> Daniel Berlin (1):
> >> wifi: brcmfmac: Support versioned scan parameter layouts
> >>
> >> Hector Martin (6):
> >> wifi: brcmfmac: Support newer PCIe core startup and interrupts
> >> wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
> >> wifi: brcmfmac: Load signed PCIe firmware images
> >> wifi: brcmfmac: Accept newer BSS information versions
> >> wifi: brcmfmac: Support versioned join requests
> >> wifi: brcmfmac: Add BCM4388 support
> >>
> >> Michael Reeves (6):
> >> wifi: brcmfmac: pcie: Report the detected chip ID to the bus
> >> wifi: brcmfmac: Match complete firmware capability names
> >> wifi: brcmfmac: Fall back to RSSI-only default join preferences
> >> wifi: brcmfmac: Use event_msgs_ext for event masks
> >> wifi: brcmfmac: Handle larger firmware band lists
> >> wifi: brcmfmac: Handle extended PMK command payloads
> >>
> >> .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
> >> .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |   9 +
> >> .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 368 +++++++------=
-
> >> .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  36 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  27 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  18 +
> >> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 124 ++++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
> >> .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
> >> .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 141 +++++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |  65 ++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |   9 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 560 +++++++++++++=
++++----
> >> .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++=
++
> >> .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
> >> .../broadcom/brcm80211/include/brcm_hw_ids.h       |   2 +
> >> .../broadcom/brcm80211/include/chipcommon.h        |   5 +
> >> 19 files changed, 1593 insertions(+), 339 deletions(-)
> >> ---
> >> base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
> >> change-id: 20260925-brcm4388-submit-5cb8d3e6d6a5
> >
> > Works for me and looks good.
>
> So what does "Works for me" mean here. Did you verify it is working on so=
me
> hardware you have? If so, please share the info.
>

Sorry, I have tested on a 14" M1 Pro MacBook Pro and a 14" M2 Max MacBook P=
ro.



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
