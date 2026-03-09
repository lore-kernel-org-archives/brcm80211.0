Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369DB38552E
	for <brcm80211@lists.linux.dev>; Mon,  9 Mar 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051230; cv=none; b=dakQ6m/TDN6BT3BH1CnhQmtPagTy69kwM6PdG8dxbg1Bma3VsE3xAhXWl9c/4iHU665TKNqwei+3RY2wF4ucBF8p8hFfKsJCbTQRgS/lkbga3XWToKVfnXWZiZ1eHUjIjSWLQbjRwrl3i3RIO1cnh9D45Udd6+CC0drzXB57fok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051230; c=relaxed/simple;
	bh=3O1ClvcZ/+xdFWhZrdKDY/UU6nQgrAeoxASJuPuB6+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jt/jruHE7YvFdR7FlHwCNXbyecLBipQ2WfPgyEkjNxzFpM1A1hh0R6//bU42iDCFHe69kgwq5hVHk455vUIb6hkr0yh3iDH3MtUCHV2zT1z8J6lKRnBvkD66OyJZI/NhMKgB5jRhUY227Bql5P2PJ35GJLg5hww8PUntC49TjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PobSy+QJ; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PobSy+QJ"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-509006c070eso19219781cf.0
        for <brcm80211@lists.linux.dev>; Mon, 09 Mar 2026 03:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773051224; x=1773656024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lWxTf/SoHGlgnYNSR0D1m34rvOQjt2x6+PCGENJ03Zw=;
        b=C+rCrCTm6dhIVlcruFw7ntKTJ1jKsDonFapFomOt8Dkn14pd8ieiDMAkTIEmuVgL82
         TLMIVqBUa5MCjoImX6E30L2YcoWkPZnB48r363WREPPY3xbg6fz91oER5biZDP1sEBn1
         pfAqALxuvaTa5UUrUbU3dPoXGwbJwxdZRsSl2OeIMcG3e0cgLN74qfeIzp6ekAa5mZ9d
         H1cOfsiFxWzYV6OZrK70eNbkRnVDTeNhwL/bMFvdRW5GUNBVg5ZHufDtsUaKDO7BhG/1
         OMZPOhb2Rqcfnm80Xh0ox4PCTDr4+PL2WrTwb9DLwHusaLao0KbyutNzHQMr5eluw2oY
         mzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1NAiXcsMiH/rkqgCCCnjUS1gNJshgf5itvTD3yJeObp/b9ZFyMyZ/imjiY7IpRItx3GNMaEzrz5U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDhemNB+0RhJpgdTUv73yCzjDO1cUIoZbJz4k8QmZvOftHrXep
	/KYL3ep2wTGiHR+ocfki0to5YS4V7HrxfJKRJZmp1+33ULboIfg0hfT2SsF00yrxaLE5CY4xr56
	q41HJb+dI23v2x6mJGjFFGEMeBBD37zy1XeWvKpAwrFyOQp1NlVZNxm8th+s67/ggLe4NtzKpzs
	6TPVjP3Z6cHPOVWxC1vgTfbAoCIKdDuwG0tAszHMCyVNQoZUQaUAmSxa796lkGcCkAjJ9EXynSZ
	lF9l4qKQo/pImUgenq8zg==
X-Gm-Gg: ATEYQzxgxJVZU2M05w5UwNHS1Uy/VtO32yHVAbq87HSk3eOWWg/N5J0OCPwP0U0Lp6P
	ug7JbSsGAVgFKY952iVDswy7AbEFCY5hE8UtBF4b4e6i7OjLQYiBDIjDDxYw8nHe2fC99l7uY0T
	eRKO0KW+D0Zij7jhAr6sskEiRphuntwuAmWulv7jExtfQd4MAjVqdpv+Rn+1NRdJDxFDAUgV3vM
	mgQNHkY+2heo5j/c7jKXavfevPufegUaow77zqz0YmLG/vHzUI3PSRT+55Wopx5EaBimdS+X6LD
	LKtLxU5t3k8xJobvtrcn1Qco+8qfY+FM1VaIYCGAM5iLOuXbK9BYSNN7Y0DbKA4LbEwKaVhaVGj
	gfQhxASdLy9UMeGoCQI5q2XGHviiZLdwNoim18hQeVlSelmEfI902+db4tZMfrE/gs9RtsQw4gm
	P7K5pN/Y8h+JA6P1FpXC5vHyoE1Dg1JyMywEJVgCFvM2QIMGXR2iYcjAC0oAeBMFQ=
X-Received: by 2002:a05:622a:1648:b0:4f1:af8d:64c with SMTP id d75a77b69052e-508f4716f8fmr128603511cf.31.1773051223698;
        Mon, 09 Mar 2026 03:13:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-508f6533f14sm9768411cf.3.2026.03.09.03.13.43
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:13:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81c571a5so660129185a.0
        for <brcm80211@lists.linux.dev>; Mon, 09 Mar 2026 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773051222; x=1773656022; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lWxTf/SoHGlgnYNSR0D1m34rvOQjt2x6+PCGENJ03Zw=;
        b=PobSy+QJPfLbGQJMfxZUjR+s97OJDMquTc6G7n2ee02jGtIZWIpkuUYI2f92+kNAAF
         N/+atZysWTJ7VuDBHs+9uICPjlFLVC06KwG6szCV3iQ0tAbfEJmOxV1Sna85Yznp13O3
         AE2KTbN+cng3V4qKFTx7Y2fbKdTJMqj4DKDCo=
X-Forwarded-Encrypted: i=1; AJvYcCW8aSxaGG/sMUsUvM/41Z56aENtBu6CGR+mJTmqjp3IvUVq8oow8GKIE/Z5X5zn6wLF9y97e6YWi6I=@lists.linux.dev
X-Received: by 2002:a05:620a:4445:b0:8cd:8f41:d939 with SMTP id af79cd13be357-8cd8f41dc97mr79908185a.7.1773051222039;
        Mon, 09 Mar 2026 03:13:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:8f41:d939 with SMTP id af79cd13be357-8cd8f41dc97mr79905985a.7.1773051221522;
        Mon, 09 Mar 2026 03:13:41 -0700 (PDT)
Received: from [10.176.2.68] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8d4cac0esm111942685a.36.2026.03.09.03.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:13:40 -0700 (PDT)
Message-ID: <1cc4caff-41fc-4827-8b29-18964b41b49a@broadcom.com>
Date: Mon, 9 Mar 2026 11:13:40 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brcmfmac: Fix error pointer dereference
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 johannes.berg@intel.com
References: <20260217023043.73631-1-ethantidmore06@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20260217023043.73631-1-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/02/2026 03:30, Ethan Tidmore wrote:
> The function brcmf_chip_add_core() can return an error pointer and is
> not checked. Add checks for error pointer.
> 
> Detected by Smatch:
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c:1010 brcmf_chip_recognition() error:
> 'core' dereferencing possible ERR_PTR()

[...]

> Fixes: cb7cf7be9eba7 ("brcmfmac: make chip related functions host interface independent")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>   .../wireless/broadcom/brcm80211/brcmfmac/chip.c   | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
