Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917575;
	b=GasCcHoZmjZjG08W0aL5DXGMWE9Gj3K82UhEkwWuMLoXTKYe1XKIK8DKMX+sX/nTMwlh
	 IEZ/En3pDqLG8euDgdFSTRV+XR31+xgfiF9OFRcqNo4iolNJJDQfVABQwKYsj4aNzQnCU
	 p3ArQzGhP8GSmxyb2OPWDoRzkw1J2ie5eJcvvMRhNcdkWHyFn6zIptX6L4UnacE+7D0xS
	 Vf4Yna0mvIsbWGSEtZiMWAwublt+41ZwXIs3IQfTM0Rv54P/cNnZIAnhAyEWE69shQzwy
	 +TLt8UP/CViWPNiggqIJQBayORp0QBFn6wxEtQJmILhSlfb6cTK5l+vdeT9N4nDgW/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917575;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
	b=X6m/kS8HzlpyRsQIBaMBYeUi5nQSYuiwnaMA40aTV8L0yt4WtuIangIzYDesGgUjRW0j
	 Zn9orBHDnLZSVakcZqq6xk3E/mdH93n292Hr0KPfU1giOGztW9YfUY2U6fELonJpXuBi4
	 Dr2Pdqc+i42RE22Y0rQLLKOZ0mN1rOumY30on0Mmc3W/mKTWsQ8sGUKLUTxVhabdzbOz3
	 InGjYIm8uBHhtkCdj7HjGtnPwRdZYOmQc2ujZ2tVbiAXRidqPAdtv/VwtYkNeVtxtNLnv
	 GDBrQJX2Y/V55KvRpdIBtcNR6+LG81oZZbtE766qbGcO7KRgBxx3msHIy0irbtKMjRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CU7AakEO;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C0606A32A
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 12:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99C0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CU7AakEO
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2eddafe648aso27857145ad.3
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 04:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917574; x=1795522374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
        b=nlruH0/ATDdaGVnkU9z0cE3Z75SXuQ3lS8IbTxxiDW3d3SEQBsPd4+4KJHGu6Y66eq
         HN5VVL1vj6yPpRxAkE8ytz+2sVuiN9jt66Is5dTxW/R+1DqdrNJE/lS6P+ViNXSb420j
         SXJqMhDRy4R22W2JI4t/rXM3YYzc6sWBYaiFJqct/AM5PzS7J23j0rmXDP3nn6VpJkgl
         imsci3Spd6y8ejqKS2EcgNeP8YTmQWAM7O4owkuBk3sC88UW9+L5y7aCJWBe7CfvVghZ
         gdjYeKX4WS7vkS4OBcxP2bZcT4rVS/i/NruT6su+gRGGQhiinwGGQPLb59c7ld+oXVPl
         1gaw==
X-Forwarded-Encrypted: i=1; AL+hErF+ZKvlTBXiUbKhde+yp6RXB5G3GuXMXMNgSsHLEkNfuR1Te/8s7P0QsLQ9mN7iC1e1qZ0TrRuuXaA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+gOwv20GQY5iVHleyWxhk4rPACH0jDC9IzNAsTErP359adLOqB
	dH30oFHp9CXpiSXRnZ/r7xHL37cGIO5NSGqIzsl4q/FQdQNpbfwUqSUFmgCa73+jAdT1AJ298VO
	S4RQuOqnc3Vi5FTfl1CRYRF0EMh2p9qhBRjD8P3WdH5NO8wKnFzMwvgBpQRXKlKhs0GTwvKT4mv
	ldbTEtkpQr5t+20L/wzoousjbGOU6SnvyHSwuy/oVaxwcpm+3v/4zOb17fwRI0FjOhxgcbNYj5S
	HtVzZVlOk8d6OtMJpDVMw==
X-Gm-Gg: AZFdTZf33XBKHtvytpPxdw7X/AOGBVzu2hEEi8olRCf16FC+jX0STQCxZf3DsZjJ2j7
	dBbVxzU51V6Vst7caBPyezfzQZ4RI+rqAUIr1zv8hS2ZpuGkMfjwchzjB4qPQkGCoK8phmzA80q
	p8h3Jqx/RreuOxlSbncx6o+GNHQUjrYQqkJt5C83LH2nChOLn8t2NEH4aenVrTcCbFY3mhDeSC4
	vnGHtIMMI8d4E/RP0uDERgJCD9o1TXsKhdhvK5Q2tn+T1tT90GQOCndNCx+WlC0WbQPLecw//Rw
	TFqXljBVbHsORfDzHcvPam9EccSiwDpcKuBaK2hr+iWWVWkeahywBSMJTXatBK0DSogHfCEycVD
	z5zkCW+2+fBaZhlgyAk25xL7w6ACkkqkZULMa6ms7sMp9vRJSo9zRbaCAab1BfpLM2fSE8oVHQ9
	p7b7GWgEQDOUaon/qHW6HBnUZoTor+Vm0TRyA7koY=
X-Received: by 2002:a17:903:1aae:b0:2ea:33eb:7375 with SMTP id d9443c01a7336-2ee0dc35c5dmr149973135ad.45.1794917573983;
        Tue, 17 Nov 2026 04:12:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2efd7abf986sm570735ad.30.2026.11.17.04.12.53
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:12:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4903fc8537aso3245514f8f.0
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 04:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794917572; x=1795522372; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
        b=CU7AakEOZIGAAJVWBTge355w5ioLICxkdHsD3TMo7bTjbLWgRQNTqC3UwQPvIxlxLT
         rpZ5dXc7C55T3h4M9Z9AKFST+8x6r9oCvl06ilk1oKPVv4wMXa8zUAYGlDHMUXtWeBoi
         7EwcZF98WK6BglDWfoQG6a792TrYDyH9UxRII=
X-Forwarded-Encrypted: i=1; AL+hErGaGA3CYOJZ5hDwDd/+wzEHodyN1TeVfq9DvcRXVMDgaWlrZNeuKgVLD3Os6O8ao4Y0AmFjUuT9ZDc=@lists.linux.dev
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr31821698f8f.43.1794917571837;
        Tue, 17 Nov 2026 04:12:51 -0800 (PST)
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr31821633f8f.43.1794917571373;
        Tue, 17 Nov 2026 04:12:51 -0800 (PST)
Received: from [10.176.3.187] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm3709465f8f.46.2026.11.17.04.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:12:50 -0800 (PST)
Message-ID: <b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
Date: Tue, 17 Nov 2026 13:12:49 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3
 ACK
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Lukas Klizas <lukas@klizas.lt>,
 Yossef Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
References: <20261104151616.70623-1-dev@deq.rocks>
 <20261116110839.4481-1-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261116110839.4481-1-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 16/11/2026 12:08, Arend van Spriel wrote:
> Thanks for the patch. The resume problem is addressed by Andre Eikmeyer's
> series "wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips" [1]:

It is all you ;-) so you can probably confirm whether this is indeed 
superseded by the series mentioned above. I marked it as such in 
linux-wireless patchwork.

Regards,
Arend
