Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCE41C701F
	for <brcm80211@lists.linux.dev>; Thu, 12 Feb 2026 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770878306; cv=none; b=JZ8yDE9Zn7nmq/Ad/l5QL/KsqOFg5zofQWhnvhRS34Z70UCKr8ix3XNBhaJDWafwUUowBzuIIjL/1+Vz3Afe/KA/e3CfMHschQENGdEoOCmIFa5YmRorGOc4cAs/ptZHnCjmkZjObFOILVZU5GbUcp2nvzmYt3LYpjhk4MlOHBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770878306; c=relaxed/simple;
	bh=tCxxY3UDXOguCn5Z6PMX8hLpOHU+oxvdtRMs/2XO+EQ=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=oNnUv2/wUSN2J0jkw9DljpsPVxAPjO4FHt5IC2ncNynmGS7ASdcdQ+BnuVb36hHZhdclS+eWDJuSFW3ELZceiGKdDh/ZEJrvmUE3rGJWKgZ0h9LRdAKDFI5VYXUP5WeOp85Y+33NRaEQZp6BEY9eVRJPtuaKWGLnHPlzLW1Y/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YUmkMB/J; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YUmkMB/J"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2a95de4b5cbso54156475ad.1
        for <brcm80211@lists.linux.dev>; Wed, 11 Feb 2026 22:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770878305; x=1771483105;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNM/BrzTJVVndX+x0JaCN6syaAPmeFxITXLSICcILmM=;
        b=QzKfNKR4pZpE9jUXCfIV0TshRczfh10N4Hp+j8k/W6tqxFbZOU3BB1FwdDKxQH3jj2
         LFNw9NvohGBlPEBJERr1t8L2CVC7UQnFoLPsabJBWlsDWkITSKlNNKvCeq5F6fm2vpUE
         0l6DRkpVhLcL2VbfdYf/RcEpFqCxslz9irExoPfhyi+8T/jtJqoupVTJuT45vVX0rWZA
         utxHPATfigLIpYgEPN/ssAch+pLoHaefFC57tckwaAUfglSJmYJGGA59tubLj7OjxK11
         XmWBzTTsggINdQzhkiIJJKhHqPHZzgUzHm26hxi+aGmm8uqKKGUTwH54wz5KzZ6W9DN3
         zkdw==
X-Forwarded-Encrypted: i=1; AJvYcCX3NJ03D9voDURwVsKdtT/jWjp7RLTS0u2ml0ku/o2PzII2UgXyFrz6onLZ3x7jQCg73UXv0QOZkTw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgCjHgaUsofPz4xxVRK2b5wlvF4u1ZwKKRGnTAc81A7LLMBiVc
	Nj+Va2KJdjQ6jMvCxUq6OW1y/5cA5QUrL6Cqy9jSomOzC7bKQBdSL/Dmh/sNHvswbLiCjz0o1ZG
	M8/nkuYiitj6kXfN2IpSlZGt4ig+/qEe3sjZEVLf/JS34gnKWI1+8mzDHm9nHIfw6lNIIyg3uDo
	Hrh9NNmdKR0RJ8RuB3PXluaoVVyfaONEqDLCTJGi48kxjTgvz6NJibFdjPjNHTUjWK8vg7fJD+n
	ENySqsXRDBcZbcPnUxJGw==
X-Gm-Gg: AZuq6aJhWj1KVLKqdwO7bqe6DYrS6NUKY0a3VtwfKrxuwGxPYhlbewru4/vdUmLtESM
	A26ZA5kT1OVBMvXM+p4hJKfROEERh7jcfFH08P4drV7Ny8pSBtIBSZiYtwRTB2SXuISVaXEbHJF
	lj04JUMWxXfIHZrdLbef9WRIhfb8uoIWUQnxTZIfgg58xyqSM3QuNn/kyl/nhnxT5OFpa+FjQX6
	5OO9n/1nAw2vGos5LlWtlnYfpkTp8/f26PnMtb2j6fRkbb63gJFsQ2dsCKfUzKN+mZbYuD8+T0y
	83LWDPbIfO5h0+5FGiCjRGQvuec54uEkvgsdg0786T6I2BjD7Wdc0Vnn3HgucxbJa7zAKGIu3jm
	luVQGO+DzpbLEsF+lwLnzWMz2f6V2C90QeCk57q3+5s43KIHbt1/xNNyT1wANy6TbyIeByPxVJT
	0de3vErq1QBB9runJfp2/6HRFTFo25ZO1uKpUBtCIL0qQdJtfOTIr8nbmLlJHH3qg=
X-Received: by 2002:a17:902:e78b:b0:2aa:d333:ce86 with SMTP id d9443c01a7336-2ab39668663mr19144905ad.6.1770878304573;
        Wed, 11 Feb 2026 22:38:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ab29884ec8sm5109885ad.22.2026.02.11.22.38.24
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Feb 2026 22:38:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso2010701eec.0
        for <brcm80211@lists.linux.dev>; Wed, 11 Feb 2026 22:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770878303; x=1771483103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LNM/BrzTJVVndX+x0JaCN6syaAPmeFxITXLSICcILmM=;
        b=YUmkMB/JMy6G6hXY/HPvHHI9qyR+pE12aJuGGtyfPEAqyH3B0fTuuOFplmUgoi7YRP
         561TiteVxV+n+Gai1vYX+aJntElWpaZ6HW40PQlrxmaMeQT5aa3Th9qbiSp77qhAqgIK
         b7+kLBnN0tqBVjh67DOICo3K3bAJ0uevRRaKY=
X-Forwarded-Encrypted: i=1; AJvYcCVY7dLaCxywcQ2fx1taGeOxFsYQdKEHFsm3zbwT47vKrTP7sxRqFcmQAAHRATHE/UdFwFJNigxid9U=@lists.linux.dev
X-Received: by 2002:a05:7300:572c:b0:2b8:26b8:3446 with SMTP id 5a478bee46e88-2baa7f6d670mr760881eec.2.1770878302853;
        Wed, 11 Feb 2026 22:38:22 -0800 (PST)
X-Received: by 2002:a05:7300:572c:b0:2b8:26b8:3446 with SMTP id 5a478bee46e88-2baa7f6d670mr760876eec.2.1770878302298;
        Wed, 11 Feb 2026 22:38:22 -0800 (PST)
Received: from [10.229.40.11] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dbcc02bsm3373410eec.8.2026.02.11.22.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 22:38:21 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
Date: Thu, 12 Feb 2026 07:38:18 +0100
Message-ID: <19c50926790.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20260203102133.1478331-1-m.szyprowski@samsung.com>
References: <CGME20260203102148eucas1p10c43be72827d74e5be41fe40a84fbd59@eucas1p1.samsung.com>
 <20260203102133.1478331-1-m.szyprowski@samsung.com>
User-Agent: AquaMail/1.56.0 (build: 105600589)
Subject: Re: [PATCH v2] wifi: brcmfmac: Fix potential kernel oops when probe fails
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 3 februari 2026 11:21:51 schreef Marek Szyprowski 
<m.szyprowski@samsung.com>:

> When probe of the sdio brcmfmac device fails for some reasons (i.e.
> missing firmware), the sdiodev->bus is set to error instead of NULL, thus
> the cleanup later in brcmf_sdio_remove() tries to free resources via
> invalid bus pointer. This happens because sdiodev->bus is set 2 times:
> first in brcmf_sdio_probe() and second time in brcmf_sdiod_probe(). Fix
> this by chaning the brcmf_sdio_probe() function to return the error code
> and set sdio->bus only there.
>
> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")

Acked-by: Arend van Spriel<arend.vanspriel@broadcom.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v2:
> - changed return type of brcmf_sdio_probe() function
>
> v1: 
> https://lore.kernel.org/all/20251231143544.4158840-1-m.szyprowski@samsung.com
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 7 +++----
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c   | 7 ++++---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.h   | 2 +-
> 3 files changed, 8 insertions(+), 8 deletions(-)


