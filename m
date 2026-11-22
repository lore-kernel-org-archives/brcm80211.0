Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378181;
	b=01GnvvlzlBECBjiRlitf+wkqG9YIs+VvZkzwtwVr8uPin4Jy2WlMxw5JnmSSCASTXoHk
	 jVZV/evuuGjmLPoJ1+vtHLnlZZe/C/6fcOm+zN/VxdOL77DMi4Y44jJWn7BwAf7uklvOJ
	 A+EYk0yilP/f7zh+tS9d6LsYdLSNWQuDfOqq4f4C9tcggQ/IQTHRlkJX3bAyV7/Q+kHF0
	 mpEaHV7IM5hnq9tx94Fn0/rriS2cgBJrtuOEIfXWscF0Z655zEjZMfFPis+WuRwGoZAhc
	 rnsfDJSHs6mTsCtNM0TYIJ+rpLQzz5DzelZrHvC8TNy4+jkTP3435xJxtkaPD0KNDgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378181;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
	b=1WlCSkaubIfyKR8FClbB9B+wnis5ZwcxLIJ50mxDDUj5cgTdwpvWWLjv0Z4guRoO6jYJ
	 hntOKODWHOAHuai9L50SLHkUijkqldeZXz3P9715oWJKxO4+kedWDCz5tNsk+7Np8kyFN
	 Dw4y/ZzdDi5Qu90trZmm2XVr/eI1yf+hkjyO3oQ2uplSSzSZ1UQdl26373STreAw7bNMI
	 tpvju+FrkSu6aY9Rm0Jp/VN/iMjegPwJr+Pg1SkXbY59XpHkqDy7tmQt2/jnvaGRsl82k
	 norx28b+LDT3yFpJ+9WgZ7xaNWtcCFRRwou29Mvp3RAVCTAZyjE0yeIPMVcyInjUHfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjqDc4gf;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910DF606A339
	for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 20:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910DF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjqDc4gf
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1281942a12.1
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378181; x=1795982981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
        b=ogz/5SyHs5j/EQo2ewMNc/5JvrrLzaLd8i/a5cMZKcXEsUpAnCydWTUZijgNupBqfp
         FcQDTIB2HjHoVyzzQyFmw1PaBx33dLxf824F7xyIVauWnI3pvae1UcOiJ53ALZIUkCvi
         loT4ZStgMnSGvxWOsDJ4D4oDlkujw8+GroKEK0x+IickKYS0qzuIjTuG4pUCqbIR6/1M
         NJW8HE5AwveK15bev0JZgh/4QGEHIRjCFQLKzoOPfxBbtJSihdrlrd+7rZIJM9LQyM3s
         fK1Nia7jDbTCwznD1j+lYoOfCVVwa38iWbGZEFrkXVTUFwZd0pBN1GtlmIUAZzRdwV1t
         JzQQ==
X-Forwarded-Encrypted: i=1; AL+hErGUSrUIc7Y76TJrLQeBeRItXtXgU+q4LfrjVhPkIH88FPw3ykjUBm4yXRErAZXIG1jj5pdekLJBogA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9kE8hx9sAJS0sBMxW5ZoyJ6ymNefWT5DpdFEAQi4toEOYegxS3
	ZPdHYI+kon7Xxb+JNWNXVmLEMRwpSs1Q2UyTN/+r+1V37RGToHOtfQw55pJxRLHtC6VKB9XEbI+
	vUk8Z/Sq5SkUXtj4CVR1DN1LzN5s4W3b8GD1hkNdg5UzyYh8edSrOarri2y9UYoFGOiyMJoSM7K
	AvjceRBs3NpGM6XvxaXZSfGbI0UKZUaRMjjj6ofn4QV2Kv6cLzywbmD6egVezdtp1fhct20i4uJ
	UsJ25ZAQTFecQh360g4zQ==
X-Gm-Gg: AZFdTZdaD1niPtnM1OURNUJXipWCHHQAwfc2QwV0wCxkYWzYl5p80QS6UXKXeSKAXAF
	nSsvV5FRP3D5+cu1TAqCe3pikjuJycH6cA6me7PWyIcCY+5NT/CCl7YIecm1wZMCuktpULTvd+D
	M1Vm4T9kBoY4lul/5BCHp/vLS/DSV8qkkMstpViNRYwDWhwTemqCHb7FIDFY3OKAGQVE+NEmqDZ
	RytX67ATd6o/AYtSsJ2I8/6zzQhrRZpQm1YcB82c6SswUFiXHW2YyTxOfwjl555rBDFqnup6M7o
	CRc2IqHzir6i0ynp3qmtd6CzNmLXbhfRFB6Wpx46xSu5XfFs9K2ZxS19a5H20nGUH+lBMRZfssE
	dZFoZiTn0kj24B0swhxPBU9i1xy1dIB8T5HbuUM2A3gGI7kYtw1l7fiWWgFj1pdDKGoKMCSrZrV
	InXU5oDTJbt1ayXMCWjSLT2yNFMIhTmAExmsY1jNMOHg==
X-Received: by 2002:a17:90b:3e81:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b41c7bc57cmr5827740a91.6.1795378180754;
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm7513436a91.8.2026.11.22.12.09.40
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94975041698so863894485a.0
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378179; x=1795982979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
        b=ZjqDc4gf61H7fek+StfrBmYxX632VJJj0mJ32Yx5dCA8LNSPqg7+pUZd4mcD1swIK4
         Kpey718q3LPfhytnMO7v83q2munx1t27/wJNRSme1enbfvCuxPxzAVPCmV5JTwubJB5G
         uovzHWwxJaLOVtEdyWoQT4TvMjKVlrPbeNZvQ=
X-Forwarded-Encrypted: i=1; AL+hErHMVuwpjNASCkdCPXJ1wmL+7vLskHq2tlwjYNeDf9tP89yybb7ArIIVQmL+r6Dv3wQkr504Cpq46dA=@lists.linux.dev
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr1770005985a.21.1795378179135;
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr1770001685a.21.1795378178726;
        Sun, 22 Nov 2026 12:09:38 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:37 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 2/7] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Sun, 22 Nov 2026 21:09:27 +0100
Message-ID: <20261122200931.2090372-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-3-dev@deq.rocks>
References: <20261104151547.70333-3-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:42 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The interface_create iovar structures and flags are firmware interface
> types like the others in fwil_types.h. Move them there so code outside
> cfg80211.c can create firmware interfaces as well.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 42 deletions(-)

Straightforward move, but not surprising the series does no longer
apply to the current wireless-next main. So a rebase is needed. You
can add my acknowledgement for this patch in v2 series:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
