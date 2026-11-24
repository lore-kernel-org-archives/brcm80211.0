Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551236;
	b=5QtigJSD1BLO2U1gSWpmuRaf9uMwpQ374oOckxWy3tNlJF/4exhBT74UStS/WqeJj98m
	 mhavymAT9YxqoNkLQmERJoc0cd1OmeuHMv3U1qytKdsPMNBB8LgXEOiK+ooWuYeXVsrcl
	 vhL8fx9mG8pzp9wrQdETyVRLlIkHFDK3ThZ8ixRjJrvbfgHwwZ/jrJXqFWXxdtBMxdXXw
	 n4pLKXrPFwyZW5UEqjNEJM0Cqw7Jlt3KOWd5glTTZwCnfoe8z9HR+SfwE/hfx6vZJhRAL
	 aWyrzY3VgNGX9BqOcnTMpOk8+krwnIzcJ3P/GNRSijA6MTCS3QhIky1CRQmeRnKu34g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551236;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
	b=NCECkSO+RkcDdPdgWYSyH5JNlDG1iK9MIi5LoKkDbVy1h2p71YFAhXx8PYMW8ZuCpsGl
	 kTn2Rrtr3bGPJK8PgeivUUJmylF5pxTjFrKNcSD63cDS8Dt9KJ2Yl2Z3WDMZZWQVx/2hn
	 rEGoBXp0uj65kA+kb7lj/zksm63t9cUWilosHg0mIXihqgHOdyqjDv0BuJnSriK8y5fit
	 UhmdU2SRzcZZthJ0NexBxWIjeRqGxCJwwoeLTexuamvHu4/D2f4Kjrw4VLg9PrCoHMWCz
	 V8UnKgS2abMabjFzRjC9xi6jycaW/TSuzfEYbplNOgv3jOvnRAA6pTlkObboqA/Xu8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ep7uhkUZ;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A40606A32C
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A40606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ep7uhkUZ
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1911385a12.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551236; x=1796156036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
        b=Yo+r9zkCLhVMe8UCFRG+J+75ygAs/eH/UYRcYFj3llSgRuS+aEAtRvvxbzgj/yKuQq
         IzDNE2fPcoeOq1dwWs1FfYlNGd79yelsDQrv4KYA4DvfIVq5vIROXUdSmA0vpUvWzXHr
         WleO2HNFg/Yykol9a+g0Cs5Gtf1W3ZLEy4fW56l33ZppOMs3OkFfSHTIgpWBknAnhCcv
         H2gMgpAFf/Q9MV3HznKuh7mPs/MX0Aqr+w+EWhQiD4yvgFB8+nZUbjNo1a1pFbHMGLSg
         YPZIgbjSDDixC/5mG6RYHgb0aYmnHiF7noupetSVPtBtr6y1SSnPOSqTC6D3ph8hBnYG
         1wjQ==
X-Forwarded-Encrypted: i=1; AL+hErHd9ZtGDEYTFKVHBYimRQPfLFgLCzYoC22TzkPH5telIH0NZ4vt26JiziEd0z16nrq1257ciGXz+/I=@lists.linux.dev
X-Gm-Message-State: APuU4Z/iax9LX1mRz65FOhsKdhyDXF5UNN5q7dl4UtH6m8kaiu/ewvFi
	JrpHKSYmXTDQ0gK4mC2VIS3/TWuXwWZlabvxdcAUJhZw3BHHfaDmbxfixghfJ0mm9xI9W+B4DLk
	S+Nd4nkVhskKTC90tsn6QNWp5v6fsK3qwH+/n6SAS/oBglXfXg/YSnMbvrV+13ZqJjWt1lVzd3F
	fwlkgE4ru4UMfFENzxBXJoZHxakzxwPvGOHQroxaocjN8tY2CnmANIyW6L5b+d0/sb/27b/4gpq
	0Y5y24XdpNTS5U+QWkIow==
X-Gm-Gg: AZFdTZeZ/zTAuqXBMtDz2reTWTFxWghPAHi5Z1K83X5iZ43TsZTajBwm7Ayt6EJ8LLb
	GTY3tMKCF+GFlXDDiQpWwgFx90m4XIi7MMa++tc3JY9pQPVTeuVlIo9AR2kz5C6e3Y5zvSSdfjc
	c80YoA/JTCAykKkULKjf4KKP2zgGkXelHNdzuQ6KCHnAFKE4UulXOXSusdaDFsCYOAjZc4ZG3uN
	I07g4p2xvPJGxYqoFMN9PfFtkwNtSoC2J1UIUKg8r9XJRS4aMrYcC8KMlWHxFpJ0Z2No768ij0D
	RR6oG9HX+74YqPZwr2oTW9QzqaDvcmWSiQ6GTD77sjNq/3lwikvcZN1hrtJfl93dsV8yzD1x0AX
	AYoYMqv6pvYMsM3KglAVLfp47ezeu8zUsMFndmSvPRbXpvT6/nT1Yvtq06VjEGAcnQIbEcs3daw
	5Ujyzc+BEv78R/ClIG5akbOm1LfpfFkEA0KPPSe1oWTA==
X-Received: by 2002:a17:90b:35c3:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b41c946374mr13191732a91.36.1795551235531;
        Tue, 24 Nov 2026 12:13:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062e6c29sm12302371a91.7.2026.11.24.12.13.55
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so862728785a.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551234; x=1796156034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
        b=Ep7uhkUZZTCs+IuiGinE5C19SJYLafMx0FO1w9hjDPzuMh8JOOuCWoSGqRmTW3dkjc
         szVFPeaJwdQoRZSXBnvXxOoaM8+M0wH+7haWtE0G9UDfJIZX04smr1sig6E0ZSCLnCy5
         xU6X4GDP3mppnyyrQTh8uhUEt9rQLDgYfmh6c=
X-Forwarded-Encrypted: i=1; AL+hErGluuca7wl1f4ynPoP9BxmsoFT6LFT025sHSgX3g7CCS+a02vtrFoWGK36HYi4LIxjpAMt1wO590fE=@lists.linux.dev
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr2711119585a.34.1795551234349;
        Tue, 24 Nov 2026 12:13:54 -0800 (PST)
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr2711111885a.34.1795551233648;
        Tue, 24 Nov 2026 12:13:53 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm1133479485a.30.2026.11.24.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:53 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Chad Aldreda <ca@modelmiser.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless] wifi: brcmfmac: fix join parameter length in IBSS join
Date: Tue, 24 Nov 2026 21:13:50 +0100
Message-ID: <20261124201350.3495772-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121092746.2917397-2-ca@modelmiser.com>
References: <20261121092746.2917397-2-ca@modelmiser.com>
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

On Sat, 21 Nov 2026 09:27:54 +0000, Chad Aldreda <ca@modelmiser.com> wrote:
> brcmf_cfg80211_join_ibss() builds the length of the SET_SSID payload in
> steps. It starts with the SSID record (36 bytes), adds
> BRCMF_ASSOC_PARAMS_FIXED_SIZE (14) when a BSSID is given, and adds
> sizeof(join_params.params_le) (16) when the channel is fixed. With both a
> BSSID and a fixed channel the result is 66, but struct brcmf_join_params
> is 52 bytes (sizes as on x86-64, where __le32 is 4-byte aligned). The
> length is passed unchanged to the protocol layer, which copies that many
> bytes from the on-stack record (brcmf_proto_bcdc_msg(),
> brcmf_msgbuf_tx_ioctl()), so 14 bytes of kernel stack beyond it are sent
> to the firmware.
>
> When the channel is fixed the whole record is in use whether or not a
> BSSID was given, so set the length to sizeof(join_params) in that branch.
> The other three cases (36, 50 and 52 bytes) are unchanged.
>
> The double count dates from the commit that added this calculation: the
> BSSID case counted WL_ASSOC_PARAMS_FIXED_SIZE, and the existing
> wl_ch_to_chanspec(), which that commit called after the BSSID case,
> added WL_ASSOC_PARAMS_FIXED_SIZE plus one chanspec again.
>
> Fixes: 69274f020a92 ("staging: brcm80211: Fixed ibss join/leave functionality in brcmfmac driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chad Aldreda <ca@modelmiser.com>
> ---

[...]

>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
