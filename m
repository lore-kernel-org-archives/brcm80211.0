Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5097242D88
	for <brcm80211@lists.linux.dev>; Wed, 14 Jan 2026 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398331; cv=none; b=GaNLGgOOc0btFBxVs4FmsyzPkmejL3CMyHLexTjYavFafwwSOvip+cwPxIzqxm7YsATANyAm9nnIQ3mGocrLpdZUUCQfplwcYDdhOUR+YeuPfp9bHulUfJNjPFZz/PVWEO9qYNSafiiCo/VAV6APDmfHdGrYJCaBB2ASxFgMDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398331; c=relaxed/simple;
	bh=vOb3CSRTNTCpH8NeWFLP0MUbTOOhehnejDJe7frRXbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UjTG97cuNXg9YLhZlYPq/xSaFQ1g+erYB1FulS0dWA/lTCsPKzvkQvZdn6BduHM9T9cQJJuouH66rvW/vKpVeuYr/NDzWcxMD7nVWjcp+e8AOuspktTimNMtgEh2yJenzxNfhN1befmyN5TgQ49TxGSLQZ1W04L+rKqc5jzf5iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=O1IE4mf/; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O1IE4mf/"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-792815157f3so35456817b3.1
        for <brcm80211@lists.linux.dev>; Wed, 14 Jan 2026 05:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398326; x=1769003126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z47x1uvVUM2IS56zlJQKoYRwLdGmlbxVa36JQqN7LFM=;
        b=av6htT48POtEIJ2FHcXnQ+psqDpoNV2tlrhqEwEF/kGk8J8/ENPQ77N+Fgk2G7LRT7
         ZlAjVQDTlzS8x/CEU9pOwchdHlzI/wFtAe2zOeEWLJqq9gFPkUS0jb2MfOXovgLTueGX
         QUUt1F+LYZX6YDoZG51uDJvP1Owd4GJTZlBD4ZHWBttAcduEr7zrmg3z9Ij9NkFJFi9d
         sy55X22S9cp6qcQGJ1Bd6bNXLmlWoqXkkJd9w7UHnQGmR8qPuYh9II+zMavYkj3oNkKh
         fZaFz+75bW5839E7iZcCyYZ2oCm/fynDj3yMRdkKtgbwoWQsgEaMqNvLiZsmUOsIgaUc
         yoGw==
X-Forwarded-Encrypted: i=1; AJvYcCVA3gFTGZZElIbeFaJPN7wfcuw54bWOMrvd0bUH/j4qaVctJHFJ1gyg2/u11/b4xH98EQTcSaE1MRg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz99n+ib+GrVUsl/9Bz6eNFmAAlMKO8ISQdsKh01X+Zr9q0W1X
	q0aTXAeTOVnOlJvUqRx/CPlcSsbh8J/Xy69VykAzAjbcuXEzpi8s1u+OIPGwJ2zTKuA1cAgRA+J
	dh9ze5xY6oVsbzVYBiE5yh3IZfjA70CclfBhaNYYGBMD1tFlwmQ2uVvoMCB21K/mf6tEdscezE4
	H/Rjqy4OcV5mRWHuRCNiCyd5SZjQ/sdNirVwC9clj9yQ98XT5PfwRE+q1pe1bM8XkvHHbnrrVXS
	9vKSui75xKaw0C1SH5wtw==
X-Gm-Gg: AY/fxX70wMUCuXIoa1h1KuN9lsi/4XrEXoAe8EAhStA5xP5hK6/eQu8oE7CxepYwcAO
	SJuQa19Oj4stTmGi25xdgBpRLjSp7lBZDwgktYdvhvmKoosG73QxUd99c/243Pjj6rLyxGti9cT
	xD8TS9SNQkXZ7erYCuUeGv+7wMuiWbdvp6W4i3v/6DmT+Ww5HYKuwviMvAZ8DJ8ZqknaY/IK+zE
	pwWTQKiyXkPJr8mfmONi2At/4H9oaN9fhze2OOF8wpBzrAnMTf8OzAqdhoA6sHwcn35KNitiOj9
	4f5iSQvrwBaoxAhalEwbzXxK7HMADayo7Y8+DNG9JxjJMfCCE+gdF/veGTihV2Y3V/QrTrdsKpw
	z7KbwmhrMHG1nwVBbN/oyQ2xqNbV0aYNBKUv0EGVS84PNpD+Yhj8YKL6j0Fni8M3mvUglkSsEXS
	z5M3O+Jz/O8heGc3agswiR2VMB4hvkAVT+spGWmeF3Q7TjnLJaeHM=
X-Received: by 2002:a05:690c:e3c8:b0:78d:6551:2913 with SMTP id 00721157ae682-793a197f313mr22905487b3.14.1768398326187;
        Wed, 14 Jan 2026 05:45:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7927329bd1bsm8723667b3.22.2026.01.14.05.45.25
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:45:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339e20b66so380898c88.0
        for <brcm80211@lists.linux.dev>; Wed, 14 Jan 2026 05:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768398325; x=1769003125; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z47x1uvVUM2IS56zlJQKoYRwLdGmlbxVa36JQqN7LFM=;
        b=O1IE4mf/mJiQ2Vm0343fO/vaq3US3qg0Ax5/GxxlEC+xLVftmkfh5VYSgz0blCU5Lu
         JmXlKt1fd/PMIGT72+c5Kt+tnJwY9hZxpQnIoVY/er94HIY9HFHv4f8Pj1MtMXfluFdi
         E16kgkeqc8LUJ5YP5HIxGn9WYvXEssWJFyQSI=
X-Forwarded-Encrypted: i=1; AJvYcCUsjisKGPbR6amb8YR13UfL3bNxLLF0M77XaZReT5l3A6dzGG5MFhPNgNKss17yPbJM5ZiRVHCb2Ts=@lists.linux.dev
X-Received: by 2002:a05:7022:7e05:b0:119:e569:f61b with SMTP id a92af1059eb24-12336a46907mr2685853c88.20.1768398324853;
        Wed, 14 Jan 2026 05:45:24 -0800 (PST)
X-Received: by 2002:a05:7022:7e05:b0:119:e569:f61b with SMTP id a92af1059eb24-12336a46907mr2685805c88.20.1768398324250;
        Wed, 14 Jan 2026 05:45:24 -0800 (PST)
Received: from [10.229.41.31] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm30964345c88.4.2026.01.14.05.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:45:23 -0800 (PST)
Message-ID: <74e3bb49-ebbe-4692-b278-c04f2a30bf96@broadcom.com>
Date: Wed, 14 Jan 2026 14:45:16 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: Fix potential kernel oops when probe
 fails
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com
References: <CGME20251231143556eucas1p141b278048039730d03edf85c6f3e5350@eucas1p1.samsung.com>
 <20251231143544.4158840-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20251231143544.4158840-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 12/31/2025 3:35 PM, Marek Szyprowski wrote:
> When probe of the sdio brcmfmac device fails for some reasons (i.e.
> missing firmware), the sdiodev->bus is set to error instead of NULL, thus
> the cleanup later in brcmf_sdio_remove() tries to free resources via
> invalid bus pointer. Fix this.

Hi Marek,

Thanks for the fix. Please consider my suggestion below...

> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> index 6a3f187320fc..6615748fa5bb 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> @@ -954,6 +954,7 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev *sdiodev)

Maybe use a local variable bus and assign it only on success:

>   	bus = brcmf_sdio_probe(sdiodev);
>   	if (IS_ERR(bus)) {
>   		ret = PTR_ERR(bus);
>   		goto out;
>   	}
> +	sdiodev->bus = bus;
>   	brcmf_sdiod_host_fixup(sdiodev->func2->card->host);

Regards,
Arend
