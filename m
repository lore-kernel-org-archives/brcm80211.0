Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709699;
	b=T+LYR+hd8wafmCnIuEiDZMKPiptBXHgFHoDXQrAhkLMgy4moWHXSIseg/F/gnZgCBR5x
	 rNQx7xLWKswS5DJhPWcuF8fZIayOlVN2IIwkCYif1Lllu4HpUEZS7IdSaP/7mZ7lRdiRr
	 29SjR6LkEqJJYklpu0pDVK8NLOqndt61ia0jZiMbj+M6dZAnTYRgL9/39iMp476V6m/AZ
	 7CVMzYUWG7nPdDsvjPD+erBYdEGOOIS7/lpnDAhKlgog14C+bAamguVn6kIRgwLgMNkAh
	 URdtE10KksIPiPP7LgUrEN2TgrtJQCgqIx1VWjd/Y3SwfHWpDwbss1kv+uAXd5AzTkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709699;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
	b=ejgUalSKIy69Ab9lyeksdoiMbxhANqkIrnWaxMdW7Z9dDmB8xDnCo1OWe9Jvc4FXMkG7
	 59qSn9gKFN/W89MJE+NXfaQsOabhlsWgJfOm5nd1zkcjnqmUuX1oP9n7GPrzyCkpnX0pH
	 oHZfjODNd+utjV89jqTXRnpxjbtve6OcuGBP0X6Y7z8ORUTuHVme57cT/CP8ZxeJARKLx
	 esFgwmlW4xXqkipVRp7k7yH5/Nxl90pQ/I+OG5DldH0nuBjq+wR5ZdAnuyzNmcv7NtSmr
	 uCfHTRC8gOBEHxwMUPIXSvX1dBMYyt2oHgp6zQ7moC5QVo3HIAyUyxHzME7fg9w1VWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AMNTAf9X;
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62798606A692
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 16:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62798606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AMNTAf9X
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so2111175e0c.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709698; x=1796314498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
        b=X7fVQ6tGyHsArBOnf6yIhfh2n5+giTVJUEVytiSiQ/gXg6OSANAaZStNwaVX1gTVWG
         5eI1cqhClWOgWZOfJhMRmwF98PH463XKaWlEBeCFB2dPEGy+pkkIk+lSHdFbOHauMtU6
         YoBQz5zpp+mNPnpMHgthlbf9IwN/DEmUQUOy14/UtR5l89ZvtAOJd1iEKL4zTqcI+YQ2
         qj9zLwZDCUkB5jcNFj9p6YgP3M95Swh5i3cWILjUkmwrD2UwVRXrKsDCJKDJpVOZJL76
         CPBxUv/8whIX0m7g3jnjZXCPJR4lGmx0ubSR39qljsw+D3Jzqz4cdgtKqspjIXxicbXl
         u9Ng==
X-Forwarded-Encrypted: i=1; AL+hErGKBSjwAOHbXbwJM/WftxEgdnnKW4RFVH7UFqrD8nmv2SE2jqNo57tC7OUXpagjxYqJs8EnKp0LZ1I=@lists.linux.dev
X-Gm-Message-State: APuU4Z93/fikYN3MHAueOVmDZ0pwd1Wz3t8k73ZKJtg51b8qyHbGRF+G
	+z/3SEPppTdSRQLdfg3oMBTpsLhYdc7FTd/RNR0daNtGMAPN7+f0Yn0ttj4ZGNHGqDNJToF7KBd
	JsSCNTbgvvYPdeWS5N1EE/hqt4wk76IFVymBZUs/BZ98+qk0RtmPz1p5sghSob5dEt/G+Q2Ddw9
	3m4/AvLrGyKtR2v47I5Carlf1ocLvSla5mvdszV+/WShjP/imsFNdrqFAuhwSkm5IDZEM/A/k6D
	bPHLsIEUHIarLEFSFJiNw==
X-Gm-Gg: AZFdTZdGJOEcaU1FdR3K6rT8Qaf48eYb0KocdEu4K+wBLgOPFDTPqW8+jd0nWUDMngA
	t6GRXpTWVsbTFDzUDN84ezcyPxt5lFx6ZIVyxRAwpJNwQiptQRkQq4LzvgrUL61QQ7D+J1AtYma
	FslFH/y3Xyd9vttjQ8U7g7eyh0AKXbsg8SlhMqSuCEKC4ZoGMwHVpwjgwlZOdNAgozFgdHN51kz
	Yf5tXbS+RhPhr4a+4Hk2xcjEqyi3D9orW5uHX+gaX4fIPgXKnwkhjCbaYR6WjTMsjpHSSdZ73Xk
	Kb1GUTk/Kxxe+fLCouTMAiKbOrt9n/L5t05KOD3SmxkORG+rLO05BPzK7bpBLx5zxeafPzLPb+b
	7GAQLLG1HehK0S8PkEboZmdAeLri0sK0QeGl/LHB8jnu8t9V8tg0mdT14r8LdtAg0evaH/kDm2Q
	LEm18sGR4lsyXT0BZdGbdn5OqjQnqWmEWv9Toyf8tljw==
X-Received: by 2002:a05:6102:950:b0:7d6:48c4:ed56 with SMTP id ada2fe7eead31-7d7393cc6d0mr11339146137.6.1795709698139;
        Thu, 26 Nov 2026 08:14:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e11edd5sm2095841241.8.2026.11.26.08.14.57
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso1220548185a.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709697; x=1796314497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
        b=AMNTAf9XEl4BKbGxjrHQkxjF73SQWNqrVdFkKrIU3C7mYMfJoMukvCqLnpfW5ur5qI
         FGIdnAsLKucAnwQtYImQmFFOi/LVm52hRuvEwIIHjiZKNEvUxeeF45i5nwpPSTKRU77B
         xD7XtunII46jaW8Met4EoFKzAxPtj6i5kMIHE=
X-Forwarded-Encrypted: i=1; AL+hErGnRPWxcIw/xRfYgoTFENl0m22sFYObu3aD0aTJD3Pb0uPOy1dzlkYQx1SvTj5mNXc1qJJYciJy6so=@lists.linux.dev
X-Received: by 2002:a05:620a:8389:b0:942:a42a:78a2 with SMTP id af79cd13be357-949ba9ffe27mr3853463885a.31.1795709697555;
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:8389:b0:942:a42a:78a2 with SMTP id af79cd13be357-949ba9ffe27mr3853459385a.31.1795709697120;
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:56 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 4/6] wifi: brcmfmac: add the AWDL data path
Date: Thu, 26 Nov 2026 17:14:43 +0100
Message-ID: <20261126161444.2484980-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-5-dev@deq.rocks>
References: <20261125190254.176055-5-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:52 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The firmware passes AWDL data frames as 802.3 frames. An LLC/SNAP
> header with the Apple OUI (aa aa 03 00 17 f2 08 00) is followed by the
> AWDL data header 03 04, a 16 bit sequence number, two reserved bytes
> and the ethertype.
>
> Let the AWDL network device send and receive plain Ethernet frames.
> brcmf_netdev_start_xmit() adds the headers and brcmf_netif_rx() removes
> them, so both count Ethernet frames. The addresses of received frames
> are moved so that they form an Ethernet header with the ethertype
> again, which keeps packet taps consistent.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 87 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  9 ++
>  .../broadcom/brcm80211/brcmfmac/core.c        | 17 ++++
>  3 files changed, 113 insertions(+)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
