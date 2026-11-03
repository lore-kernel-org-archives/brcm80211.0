Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713868;
	b=Q2nTws75cPBbcAY4wJ5Hwtsvvs47xyHZxKPKWUl4XVhu41tjREyaaG/qHYqAZZVTVCrd
	 eE8Dz+mwod6Eub86PwBHxC9vtc9Ok4GBFXZ3rwd49LAoH08tfNaxOKEF5ECgSIELdFF++
	 7et93fz6rs1cjx7/rOpKysOs951KrT23HQ496i0Ru3Caglz/mU3qloZM/fC6PX5CyuSL0
	 t71lOB5yJJKvLacDsCn8UgXjVq0OjOG0nc2jiI+87aWq31j9Ucy9aAh5EUro2gylPokJT
	 CeFgqKL5IMUw7REOAHN+x7u5x1klQjvgKBt9ZyICuKgpCqxXyfe/CTP5EnxLwTEP63A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713868;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
	b=E/0ruI4YYuKY3NYGBIUqmCJwwWFj3Enk/HLnu0vA83Q14Fzvihn2yeyHCVx03GcHBYF6
	 cUIhJZeytuuUq6yXsk3+hxIGGfQP+Wd/jKtpWBvDKCBsnruXs/RgcxQ6eqlAB1pGQ3OBJ
	 UaCuDXxxuhvxQh3G32U0cYwLFZ4YERCjK8Njj9pBsmLAgMLVJUAwzdqDxD97g8hY3kUUT
	 pDXO6/QR1EQXPkkKLm2BGDKP6jEhORugSiu8CDtpfU66vq4LERvsMVYG5YNtP6Tr+aH9v
	 B/ibMR+ILU+1Ao17EHJj9aPj8qgpvfpyvKP0U4ZHFlyAA7mHiofZAJhpBr1TQdR/ZMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TiRriM4n;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9400C606D823
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9400C606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TiRriM4n
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2189775a91.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713867; x=1794318667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
        b=D4Azak3IqcAzU3O/eUSOByQQUgLBBASESrglalpFLHJPO6umMliM0pPnknQorgKW9a
         lsao3Q5WBb5xMFi9CTi2vSON6tnrck5fh4z8fE7Ras+7QvM0uG7yyRd17eiWyYHC9U3N
         0KD6S4YrFZLxJCWC4UOg02/ez/4Vj+aq03clgFVRJl09KZCpMnvTFT0IqGQaY9l4Pka6
         Ng04P1G27ycT7aGLNgKQDuJ0klhum26NZa9RS5a/YBChl41uIeaGAHWuoIiu3qVFVDpF
         OM6hgJBq0B7eUGWMnQrY2smLj6hu9WZEbZ4h8+ylO0tnVDM6VLgY9fStVQappHry7/Ch
         Gkcw==
X-Forwarded-Encrypted: i=1; AKwUvBwEo+gFEA8g16NSBofSdeQcEauIbAFScKT69lG9Y05U3srkTSddKCGxR/DEN90X36eHzqlthqWPibM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ORGGvijL2uayBXBv2fVmvFTqc5E4SnQavCFZs7D26VReN7Ecf
	mZZqvIUXr8vb6KfBSxTUrYqomRj9yLYw9tcOBtEfhQ9I3U8XKfc74EQQ7ykgkJTg8sEKeOJddjE
	4RsqLyfV0IbpA3cylAKC+MPAkIbTGCTdNAAAnbQnggf83pfhOnBdA7y238CWLeDgtGvmpg0ppLt
	YcXa66ey70j+dQAtxwD+S1Feije38w1pQylJ5DTLD7q6qbs0fe8c+vZGZJ54OV7sX06NQr+Upmp
	nGNaYzPwEV38ydZ/5w=
X-Gm-Gg: AYBFou2Tjhrqs0BY3mG7ZnP9ntiz+WLrbo1Cd3SGy4HVl9FwG8FRxRAmuHf86RZ9iLa
	DgBGUEkMjZCM1HjmEAYVeiOJ04CS8D0wqGvy00jrW7a2QGJzOkz6CkOskA1KHZQefX6h4P1Xfvo
	ByBRJvOiwV3TjxJjpVE65bvCp8nx3QFxtPBPUVJ3MJ30626AxbbqG0yHyeRRpI/s8l0CiDCPc27
	m/cj4KlpcPfU7hZeYv4SrzG7b87QVC7cOdKOXlEWPlwG7ftgXc80O5k8H3twl+GLR3e2UOCku/g
	SnrWHFuWos9MbDiIlfMDg0JUl0JTgnPsDcY7vkoUHP8eDrIfQF7LoYDyxYpZWmcHr5DxUWnfQ4L
	iLJYCuRhwYG14F6MYZp1KvBLgcQQurxpFViNagbYVB2IEu240LWZ7z33CsDLg6f/7bJdnLBZDCW
	0UjAbs4f4qqNGb9YNOXfUOfNQQMrIAA5c1Au0uauM=
X-Received: by 2002:a17:90b:180d:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ae8983f058mr10469737a91.46.1793713866847;
        Tue, 03 Nov 2026 05:51:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07cab84edsm1832070a91.7.2026.11.03.05.51.06
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:51:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338ff2cf14so81572491cf.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793713865; x=1794318665; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
        b=TiRriM4njZ8oJhLb10sIsROEzDIGQIGSHtMaIhNLn47vVKJ2DWzDb/OotsIr1w6vO1
         OCWufmJMfMZWaPfIAxiNhEtVEeec0zd81HdEcyynhi+Np6L3f0RqYNes6p7CNr8EgNVS
         cCfA1asM0KYjOe4YSmgo0NHHRvf24Zy8TW3zQ=
X-Forwarded-Encrypted: i=1; AKwUvBzcU9YW1jQgXFVcIHo71Otmeate4xm0ub5W9/qhFzyjGtCZ3HEWK3Jrc/HTO5MPydPp9lfYzu9+NKQ=@lists.linux.dev
X-Received: by 2002:ac8:5a4a:0:b0:535:84e3:ceef with SMTP id d75a77b69052e-542b781c626mr217069791cf.45.1793713865345;
        Tue, 03 Nov 2026 05:51:05 -0800 (PST)
X-Received: by 2002:ac8:5a4a:0:b0:535:84e3:ceef with SMTP id d75a77b69052e-542b781c626mr217069361cf.45.1793713864762;
        Tue, 03 Nov 2026 05:51:04 -0800 (PST)
Received: from [10.176.3.155] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e77e5efc3sm870636d6.39.2026.11.03.05.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
Message-ID: <533b31e4-c837-494d-a4ce-a728bfbe07b2@broadcom.com>
Date: Tue, 3 Nov 2026 14:51:00 +0100
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
To: Janne Grunau <j@jannau.net>
Cc: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 linux-kernel@vger.kernel.org, Hante Meuleman <meuleman@broadcom.com>,
 linux-hardening@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 Izabela Bakollari <ibakolla@redhat.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
 <d78cbbd2-601a-4cf1-800f-3be57a2b7de2@broadcom.com>
 <20261102204627.GB770347@robin.jannau.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261102204627.GB770347@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/11/2026 21:46, Janne Grunau wrote:
> On Sun, Nov 01, 2026 at 08:27:22PM +0100, Arend van Spriel wrote:
>> + Peter, Izabela
>>
>> On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
>>> The Broadcom BCM4388 chipset requires new PCIe initialization and
>>> firmware interfaces. Add support for these interfaces to brcmfmac to
>>> enable basic station operation.
>>>
>>> This series adds:
>>> - Signed firmware loading and mailbox transport
>>> - Fixes for chip identification and firmware capability matching
>>> - Versioned scan and join requests, and extended PMK payloads
>>> - Updated event mask handling
>>>
>>> These changes include work by Hector Martin and Daniel Berlin from Asahi
>>> Linux, refactored where needed for upstream inclusion.
>>>
>>> The series provides basic station support only. 6 GHz support is planned
>>> for a follow-up patchset after this lands. The driver retains legacy
>>> interfaces for older firmware.
>>>
>>> Tested on an Apple M3 MacBook Air (J613):
>>> - Device boot and network scanning
>>> - 5 GHz WPA2-PSK association and DHCP
>>> - Bidirectional TCP traffic
>>
>> Finally got some time to get this series tested on my setup. The patches
>> generally look good. So far no regressions observed. It would be good if
>> some more people could test this series on their equipment. I will do
>> some more testing and wait some days.
> 
> Tested series on top of v7.3 + commit 7ed5dce55fa8 ("wifi: brcmfmac: map
> msgbuf RX packet IDs bidirectional") in wireless/main with resolving the
> conflict by dropping the conflicting hunk of this series.
> 
> Tested on Mac mini (M1, BCM4378) and Macbook Pro 14-inch (M1 Max,
> BCM4387) without regressions (except for the resolved RX msgbuf
> mapping).
> 
> Tested-by: Janne Grunau <j@jannau.net>
No regressions seen on my 43664 and 43455 devices. So will process the 
patches now.

Regards,
Arend
