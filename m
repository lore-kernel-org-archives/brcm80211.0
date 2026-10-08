Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2384B1473
	for <brcm80211@lists.linux.dev>; Thu,  8 Oct 2026 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485428; cv=none; b=r7dafYqRmsxj5veAH6+c1ozDNn7bBVbjOxw2xIwfLZPysmkdSA2jf/0LYhVTuXnAW5qDWasbcX+hij1TwtI2LiARnmBUOh+YzBnRfpczAMjyXwWLEnKnDcO5lKt3jePEATyMS9sDtisxm+1Wb+remX3bTsfSw7ITNuUP6x/16VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485428; c=relaxed/simple;
	bh=blDRYnm+eYgcYCYVIwypwt6R81KRKfjTWhx2Jnw4ho0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k78T7idqnOJoOUQa8jOSCpK4MYkR/cVwrpmIW48ZEhDZ32WaUzzymqmj9u7DaQnqTSw/cjVThiCpGJ2i3jtHcRzlv58H9KqK3iGpirL0SFfcyww3N8OtCkboW+GYSxGsHcaNXqF5sGyPZRot+o8PhQ3B+6LyQOYV7n3mtBrZUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=K8zIilva; arc=none smtp.client-ip=74.125.224.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="K8zIilva"
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-678febd9307so1276133d50.0
        for <brcm80211@lists.linux.dev>; Thu, 08 Oct 2026 11:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485419; x=1792090219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ArLs8huVVv4YGyFYXEbwrJuK+8e9tYytWAQhJ+uGSg0=;
        b=BeZAhpMShECF90EWo23a9z+C3WSSAsFt4sPbn8Bo4Tn1qJ4d/U9TFDmbxL1Pur9s0e
         Xb1yHwseUmarW8Ui0VUUN5HGTa+4G/Fho9kQnNSMcq+goh1Rf3vXLnsMVfpeJpYjGIt+
         YsUn2n7PFxw/O01sHNVmB6L4GotemzBNwtNqmTECXznvlWPV+bVbKJZoU0uVnPwdjrfo
         PslZMX/PVWVzC5FZbWwHUTaK4fRwvF30V6EYmZdYcp2TiW9d+bqhlkh/AgRr/PV0YjQV
         nBiX3yKpzha5wCVJTGo/fNBaEw8O7Bx8nEbE/X5FgaPEiLkt/9GKkxij1ah6WbW7aqJi
         +D7Q==
X-Forwarded-Encrypted: i=1; AKwUvByO8jKROkdZeLYGyIk5E5MA0wr+5PAXZjp4k2wRCP1uJGTAMKoE1P+EELWXjZkmlGUqBwoOZD0u7/A=@lists.linux.dev
X-Gm-Message-State: AFq9FYIY9hHgVWA4r2UfSjtg3IvIxUcEJ/bmT6FQTc/kdIBP6p61X1k2
	TzDv8aX9LMBH2vFpQkr2Qo8L+q7qcfiTBjtgKT1bNXPhi2GZFWkKeuJK6uoyJ6MYJsHg3EBHxFU
	SXeAvVTnxumkADFWuRT9eKON6E80rGBdvl8vKIjahiZOba7PphBlk2UdzWUypbiDmAjn8MRpk0Y
	MLpcPfJZ2RdzAN9Pt+jVyiJuafrAIBYYdkYs94mKTwrZ9YW+BriZaXmarV6R6XfDbP17DpyiL7K
	AZ+KDGSFmJK+WAPZ0YK/A==
X-Gm-Gg: AYBFou154sQ0YttsP6GjiTcFrqec6xfj1SM6uQyfMQyyxbqn5vrxx9JTs0Kg3dNKQoF
	gS2bUkdNmWI1WD3kcRhUB38fqcFgIzPnAbJSNPAh+/lQNavqz0Y63Gd1pmWw3SWQReGhaQw4f7q
	274h2eqfL3r3bzW3kTm2gHFEoIyzHPUX1+cXjLkOVgxatWY2m1FX9PjnV8d9Eg6SmSJhjZ0/nhh
	P9qhp2ta6RM2SJVxpKpVi4ABMSxfi+wy4sE3hdPpp8jWcj9U9+LgvBAMZSPRpLQkZlqOfQFWbXQ
	HvokiXSQLSB7nggi0VNEgiBskjPy1t/lX+cKEr+zZoey+NocikKULnxiDAmAfFLRY4mCvE1Xd6F
	saprF+pQIELL82mQlgxnSbPUInpzNNb8pzwlCc5LUDJjCTOJEpIQdDtlPzVPIZ/LNZLSKUjyn3m
	7/CRuRyhbwZPYJA1+wVQ0nyqcNxnpishF2xNBdR7xkNQ==
X-Received: by 2002:a05:690e:484a:b0:677:d9a1:f069 with SMTP id 956f58d0204a3-67922e0b611mr786225d50.34.1791485418421;
        Thu, 08 Oct 2026 11:50:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67934e226cbsm1961d50.35.2026.10.08.11.50.17
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Oct 2026 11:50:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2d93b92937so553343666b.1
        for <brcm80211@lists.linux.dev>; Thu, 08 Oct 2026 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791485416; x=1792090216; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArLs8huVVv4YGyFYXEbwrJuK+8e9tYytWAQhJ+uGSg0=;
        b=K8zIilvaJsJBJNp4YmNY8i3Rda+cvQIrsfF1qgZKMj2wfP/sHTflvX9rVsqI8tGKu4
         6FH3L1eZN1QxeZ8h3iqAzXT2z0UY9VK5J/d7t7d+gscney7JrGMUImA7DkWnH3lnUpvq
         bWP/jh/yRcbPRo+XGoX0asmHrwumn6EqHoYjQ=
X-Forwarded-Encrypted: i=1; AKwUvBz2QVi4RjNFMXt9d2KO/bTOaCkSmWLf6r3EJuETABnYr4suveX/r8hU2mgHADzltUGfe2GzQMZ9Jnw=@lists.linux.dev
X-Received: by 2002:a17:907:9714:b0:c2a:ad55:b3fa with SMTP id a640c23a62f3a-c31a6dff0d4mr4825966b.7.1791485416076;
        Thu, 08 Oct 2026 11:50:16 -0700 (PDT)
X-Received: by 2002:a17:907:9714:b0:c2a:ad55:b3fa with SMTP id a640c23a62f3a-c31a6dff0d4mr4822066b.7.1791485415048;
        Thu, 08 Oct 2026 11:50:15 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a4755f97sm6735666b.10.2026.10.08.11.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 11:50:14 -0700 (PDT)
Message-ID: <08bc02e9-77ea-4bcc-b087-de720d2449f7@broadcom.com>
Date: Thu, 8 Oct 2026 20:50:13 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: drop glom superframe on header parse
 failure
To: Shirong Zhao <shxzhaosr@163.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20261008103312.20-1-shxzhaosr@163.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261008103312.20-1-shxzhaosr@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 08/10/2026 12:33, Shirong Zhao wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
> 
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
> 
> Verified against wireless.git main (9727d1c4e1c9), the current
> wireless fixes tree.

Thanks for the patch.
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> index 381801af3..53ffb8dba 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> @@ -1649,6 +1649,18 @@ static u8 brcmf_sdio_rxglom(struct brcmf_sdio *bus, u8 rxseq)
>   		errcode = brcmf_sdio_hdparse(bus, pfirst->data, &rd_new,
>   					     BRCMF_SDIO_FT_SUPER);

I would avoid the extra release/claim host below. I modified your change 
to what I think it should be:

> +		if (errcode) {
> +			/* Superframe header is bad; rd_new fields are not
> +			 * valid here. Drop it like a bad subframe below.
> +			 */
> +			brcmf_sdio_rxfail(bus, true, false);
> +			bus->sdcnt.rxglomfail++;
> +			brcmf_sdio_free_glom(bus);
> +			sdio_release_host(bus->sdiodev->func1);
> +			bus->cur_read.len = 0;
> +			return 0;
> +		}
>   		sdio_release_host(bus->sdiodev->func1);
>   		bus->cur_read.len = rd_new.len_nxtfrm << 4;
>   
>   		/* Remove superframe header, remember offset */

Regards,
Arend
