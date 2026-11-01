Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561248;
	b=iB5887fB3r8q7AUeeEXwC3xZKLR2M6r2dNTYm2qEZmqpKtapUXu7yfOEfhimN5HRvbyc
	 UILoC6IT7qwbzormWHhu0bVP4CvcYEtdXtFpVH6ZfzhF3g4PTJ0bKcHUBdywhZQtFP390
	 Z00sjIwytmmOZ1lQwLZHXeJo2URc21Dto0WNhVr+GBDRyAYAZUq3SXSG0edQgYsBzmGAh
	 vzEbFl8s8TX2R6HrkViLB79Qcy/J9dhMmTE9HLseC0oby0qIfWQXi0DewXLl59844i3Hd
	 S8/Krf/sbzu/uh7sjdzCXNmxucy13svS+IEjk8CgHWhX1NX1H/OIQM3s5PuADbrrYgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561248;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
	b=SB8nSETGdDGBzSLevyO3WsE/rsaBxFJfyssGdWkX9ZzT1N9l01+hQV92E/jDiyiMy4Dc
	 t2043FAxV1AIRi/enCfKYTqMKHihjtNnfLkcgEDoqM4NxUU/vUHfRQqaLWqzYbbnlVzyQ
	 wLHbqmFPNjibPw9/vbm1cXuUW6QFtjhxYudqZmC2MA+wZKidZqck3dUgP7tn0yaAI7F0M
	 iymmRqVUhXUjKbQzhmDpHspopg7+G+3P7HLXmLC+Gz2cOk7mkvn0OHvAFnyYLWhxNWDbs
	 Z4lx7q3q/Ipk0MqXG4bOCSJJt/dSdM+mMEu0Lj6tjYHNHhZ3nNGeVQrTPAisT0AXhTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKkv0k6d;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56182606A32E
	for <brcm80211@lists.linux.dev>; Sun,  1 Nov 2026 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56182606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKkv0k6d
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb2893531bso133641a12.1
        for <brcm80211@lists.linux.dev>; Sun, 01 Nov 2026 11:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561248; x=1794166048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
        b=s1+yGvY3mHvAAp86wnIb/Q2Dey6578waZIODOqHhsIlKRcVVDnv8VZo76Yu0tfmJ/S
         kwLsDXHPrJl4qDcduRiiYMSFogUEmvwaUgdadTLQKf4IWq5QHWQlIPqo8BSC99y3HQED
         iwdHVcTf2nGqmS4xpDu9HDoaaysYMwE3DDFcU2sxYSdivuHqb9GGG/+/kUQO9Y/6pSY5
         JD+fmOMDyL2JgYXO8j6K+r6r950N7VH3q4Wj5Gn8H10G8b26MgYV3pZ5H/4sbUcnFL+s
         FZCr1DkC0PEINwwet0hTiZaB6pDqoIwpIEKhRLz53avktZC58iNntb0sNM3Y5lskOa+Q
         wN6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5Rlq4YSTlsljnAUybWANSrXhdogl2Yh60OCsRj+uJOwzmfjTFFlLnKfHuXPp6F+Hyf6DryxsBPLo=@lists.linux.dev
X-Gm-Message-State: APuU4Z/f08gH5nreVPfeKNCI1Qi8+/qt8p+fL0+N0Ek1oJnbI/PX0SVx
	2N3RMvqyGdnmYQwU96Xa0My9bgh+ddxxK6dOrIeUTFvJzNWczgK89MPgrdngdsC7UR3x3k65gIr
	642WWI2fOOqASG1hs8qfkp3olzCu6+Z3sSebT50EMGKN3KiQrmWqcfaLF4DlU8UJqzrCZXTdHiU
	aDNDzMN2zJrgz9SbWNNnH3X5Hg/tX22Z8q741vnBz1P6cFmKI4hUdh//wwThNnrR1D4Z5DGSdxJ
	gOEnlo4pa7Clde7Erc=
X-Gm-Gg: AYBFou10DG/JdE/phaRCIF1OFoW/1ZsnihinlFRwtUKIRqGEz+Er6R7HtZHhCqdwaRx
	NUra37mbEG41km1DH2OmbvJCH87d5fx1AhBxpIQTYOtk85CiEAwjRrt4/8sNwUe/NN47IMpumPH
	5gMM8jg4nX/YrT8MLYvk0VtWLDkSGpBR8JBSGvCqI9rIgiBcs29WVvstIqkhFVTS9sjsCplxz+a
	8Z+X87AGCT+qa1dojlWB6jtHofyYh8iI7wWS3DQwVdbv31PA/kjBUNOmqU64LWVbAS7fgy+4bSK
	Ltjw32hSI5eiMabkAhXCQel5ZZbjpH0iIW14he5Hbw3wuwfK92HGrl5m8K48J6vMvBl5OWN77xW
	JinDiio5ehl0iaBj5Nu+E702QJwrkaUml/D0I5KU+2tugltRzFu0T+IKSIHT7F6sDKmUJFv0yfK
	xrgvjkc5WJXapEWS9MQp69DjLLQYeOxzz+q062gqk=
X-Received: by 2002:a17:90b:1b08:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3ae8982af58mr6570453a91.35.1793561247679;
        Sun, 01 Nov 2026 11:27:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae8809c5ebsm2900348a91.4.2026.11.01.11.27.25
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:27:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c429d9d05f0so108935066b.1
        for <brcm80211@lists.linux.dev>; Sun, 01 Nov 2026 11:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793561244; x=1794166044; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
        b=IKkv0k6dLyQrspRl+xKlhsrAkqHPAWO4utOQGPf0toYwECoz401QNuZOC6WwGLQgr1
         UCsGcg+ZRRb7ortV6nWnr1oTq3KTmHI6lg+ObWlsaIwyw0KXgb0yJa7Z3kghMFokeZ40
         3dCyIlfropEHibOGs57HQSgW+hMUDngBgB6tM=
X-Forwarded-Encrypted: i=1; AKwUvByiAhmqFTYfkUftNOQakwjLAGRWoJtiWcpZEqCIfKwu4/2w/kFEDTNeyLdEEWfU0L8+YMLBsWzK5gY=@lists.linux.dev
X-Received: by 2002:a17:907:86a4:b0:c46:9d7b:37d with SMTP id a640c23a62f3a-c4ca7a4b544mr641619866b.17.1793561244357;
        Sun, 01 Nov 2026 11:27:24 -0800 (PST)
X-Received: by 2002:a17:907:86a4:b0:c46:9d7b:37d with SMTP id a640c23a62f3a-c4ca7a4b544mr641618066b.17.1793561243910;
        Sun, 01 Nov 2026 11:27:23 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm303460866b.5.2026.11.01.11.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:27:22 -0800 (PST)
Message-ID: <d78cbbd2-601a-4cf1-800f-3be57a2b7de2@broadcom.com>
Date: Sun, 1 Nov 2026 20:27:22 +0100
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org,
 Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>,
 Izabela Bakollari <ibakolla@redhat.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

+ Peter, Izabela

On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
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

Finally got some time to get this series tested on my setup. The patches 
generally look good. So far no regressions observed. It would be good if 
some more people could test this series on their equipment. I will do 
some more testing and wait some days.

Regards,
Arend
