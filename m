Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B39C2E03E4
	for <brcm80211@lists.linux.dev>; Tue,  3 Feb 2026 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119135; cv=none; b=cGSSN3NILZ8fXTwtv8RT0Vl+va9oBOxe3Pdt4LABZe5fokgeusKkZhPkQduM9IhUAhTYJWCESUdOc1Fh6stUmM74aOVteI/28rp4GRYO4FJWgw41vdIA4E9kmTy3J8WsTnrLuTWIGFRmgkY7DsIPH9jBvMhPRRHhwytPB4veAwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119135; c=relaxed/simple;
	bh=h+x+1dnLVzTqk4z4LoCwW366wnW3d0sD2AyCQwPr4WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mn6R2YMmfa92cOLZgjFIsLmBMmil9JZPzYfcLR57L0mDL1poE2ujLJyy9RTRDNGSMCyFSmLZd5xbvSTnQaDWeB6lXLsLDZZwrX6uADCNvYGEp14DJDxi27HekST9KRJahzGO8VCEmRTulLuqCN4cIhhkgIAyK/Vu0OMz3yAro7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=O2MMI8wx; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O2MMI8wx"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-794ed669269so12589537b3.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Feb 2026 03:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770119133; x=1770723933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsO4mxJQRQJx5wwfoRnZCOL7vZd5syOyMScGMVLGzdw=;
        b=UFKwaW8m/4+7HDYhCUlFNvznL2dSDoyKixzQKzb2/rPh07NRwuGxbtxdl6B/18L1P6
         AE4RfGf98eXW4QwKzGjLdIMl5eLYctBypcIwerKRkEN7ZsDhvtboQwb6jUujV7z17ovZ
         QNK5ZY1piQni5dV77IIMYcF7fPrh2k24jkcXrm4keodNw2m0XcpbPj33XCYjQS+PuxIs
         Y1WkW5LyYWsosesS70Mz+FrUZtLs8KmVFff4xayk3M256n2tzuS8rlGTMFg7UDR2t9ba
         NQFNNx5kzVzuq2uFG2aCUbc4KHob4eI8MKHVSdXOyYZ9oLNb+IwCn+SGOJwDoy83RRdX
         qA1g==
X-Forwarded-Encrypted: i=1; AJvYcCVqllgGQva3P/bBmzECOM543eVdJjerX3KrlBkPy1y7xFnsaHoJvvGnIOsTRxApY1dIYoY7xkV598Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAjhusO022MBHjZAL5fxRpGEI00rUFZ82kvNqHbtKJyT3STU9C
	ZGfNkqS7VITtQbSbUi0nDNP66D791ZkwdSG3YvTH7p56tEb5p4DiO2QW0ZawVys4YNmvErP8gEe
	zSWladPmjU1XR17m/0GgUhbPiDjB3BNij3hLDGw2ngw6OW9KKqJrMGgogRw+g+wRePh6J4hPhu1
	9dY9GfMVPDJVZCFzIeKzGYIZB96CtpLuCpaz7vqSS+tqEWlAON/xzVumraZP85gAA1MbmeFP9ip
	xml4KGtNEHTXVTPkU4XCw==
X-Gm-Gg: AZuq6aJb2+XfUcRxxcwj9YrdkBedy/wnuiVLGXBYYFKTOhlleh4bLzSEzpdbCh0rcUG
	wiHnt9hROSh022dg6h+MdoEfAUEpWSFNZf9QD6HGfYIG94V3NcOwHbLaCrRO128tHBJ39uK6tu3
	ewhqZiFwjROn4/s0sRKC5P8RHenWJZFXgQDGPd3M4VYuM46FTA5hM9Y36t6ApWI4OA5bXtQSAYt
	XqOkdJAS/+8NIdcBegsmPckllZ/fSz54TZDe690lpi6g7Kv9qSv5+jbcsn72y6nBABAlWraMLjx
	G7ptBWG7Ag9PdzNdTFt4FPbHOGPUvpzVUeuLn8ph1vxwhGtZimP7euwDx96MftYugnmMUcx815G
	cvTFhRsIDzmZbXjKDd4k1d1p4aymigtaUsoBjgRsNfCDEUAmGP7uk0G6cSHe+vUScFkO/QaOHgC
	eiRbiUGtGvJxHXfsm9olE882fKKAr42TZ3JD+N5MBy/617vw==
X-Received: by 2002:a05:690c:fc2:b0:786:7bb8:c127 with SMTP id 00721157ae682-794eccb57b4mr25139107b3.1.1770119133091;
        Tue, 03 Feb 2026 03:45:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-794d9f02d07sm3536057b3.16.2026.02.03.03.45.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:45:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71bdcd037so467576eec.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Feb 2026 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770119132; x=1770723932; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CsO4mxJQRQJx5wwfoRnZCOL7vZd5syOyMScGMVLGzdw=;
        b=O2MMI8wxDbqpaNvRfID5itcgg3dG4v29WpVHuGW1chkdyKXnCN3qQ7cIz9hrpFRlHm
         ehzohg3job3rEBf5GjtL7D9Kz6XdslWnDbq5J1j4w+GgBygUT4TWKzyf6UdutoYQoaIx
         20c2nIs6hedbkoTQnOreZW+mApRonuu4SMXE4=
X-Forwarded-Encrypted: i=1; AJvYcCXZJZ/k840kir5DLDcNwJyuFG6yL1lr89A4k8vbVNYP5dLIPDr8GbTdAA1l2NWZbgM0OfvESHVqS+k=@lists.linux.dev
X-Received: by 2002:a05:7022:2521:b0:122:3df:fccb with SMTP id a92af1059eb24-126ea8e7c51mr1136911c88.10.1770119131826;
        Tue, 03 Feb 2026 03:45:31 -0800 (PST)
X-Received: by 2002:a05:7022:2521:b0:122:3df:fccb with SMTP id a92af1059eb24-126ea8e7c51mr1136898c88.10.1770119131344;
        Tue, 03 Feb 2026 03:45:31 -0800 (PST)
Received: from [10.229.41.199] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b658sm19030762c88.3.2026.02.03.03.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:45:30 -0800 (PST)
Message-ID: <b49e525c-6dfc-4cf4-9aae-b22485341c67@broadcom.com>
Date: Tue, 3 Feb 2026 12:45:30 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: brcmfmac: Fix potential kernel oops when probe
 fails
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com
References: <CGME20260203102148eucas1p10c43be72827d74e5be41fe40a84fbd59@eucas1p1.samsung.com>
 <20260203102133.1478331-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20260203102133.1478331-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 03/02/2026 11:21, Marek Szyprowski wrote:
> When probe of the sdio brcmfmac device fails for some reasons (i.e.
> missing firmware), the sdiodev->bus is set to error instead of NULL, thus
> the cleanup later in brcmf_sdio_remove() tries to free resources via
> invalid bus pointer. This happens because sdiodev->bus is set 2 times:
> first in brcmf_sdio_probe() and second time in brcmf_sdiod_probe(). Fix
> this by chaning the brcmf_sdio_probe() function to return the error code
> and set sdio->bus only there.

Looks much better, but wanted to see what was done in the commit 
referenced in the Fixes: tag.

> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")

So that patch wanted to propagate the result of 
devm_clk_get_optional_enabled() call in brcmf_of_probe():of.c to retry 
later. It ends up in brcmf_sdio_probe_attach() which is called in 
brcmf_sdio_probe(). Anyway, it seems okay to me. Will give it a spin in 
my setup just to be sure.

Thanks,
Arend
