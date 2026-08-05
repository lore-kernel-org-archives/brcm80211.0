Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB153ACEE1
	for <brcm80211@lists.linux.dev>; Wed,  5 Aug 2026 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909922; cv=none; b=cLYXR9d6yyOkJ66rQtxl6aEA3KqMnHXUuLZFzjCbr1pXiZyIgwLEeLOFMIUA32fRpigNu8+XS6ZSoY6Xzc7/noXP6bCqu8IluhJnTzws4OS5xhqn/l+U/izusw8eDrnfmqy7pIcM7GrYykcYKjOReRTbM+dQmxNsW/gUA6rgzZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909922; c=relaxed/simple;
	bh=OriPhg6YGIwEW9hmmH46YSgFHuBbRMq19BdArA9MZD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpEFmFp9IyVQMYx7t2r2Tsevm67o7NFgzZyuliiYnx2xx3lNnsHsAfu0bV+WRFC0RCt5FxV8/+xazxLX0fjo3LXrcITXdu/phDMagzKCYdXbgWzI5GBlkHKSBt9dHoa0oDQkpHggFZojUzGP0lPRZuIvPWSBnu3Uj5IyCMph7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bHD56ZXN; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bHD56ZXN"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-84830c774a0so629570b3a.1
        for <brcm80211@lists.linux.dev>; Tue, 04 Aug 2026 23:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909920; x=1786514720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ixvJyzHf6CwQR78Vnc98OrtjL5Qm3qHKniNH1npgOPE=;
        b=ZWtBL3ECb2UiLgGvI2hVcowHt0wOYRo4s5ZN4m7tipXsok02ulNlhL3Z4jxyNFtFvp
         wfjDBDFzDbzxTQ682PY+3faSzSNSd4JhLz/jzIu2DCtu3YQS8HL0wo+dA0pdx9uwrO81
         yPhty8gN8M235j/Sz+ErhVnhpFD8c0KphxT7krTYE59iB8XXUinPalAOyaws/Swf/Xss
         3fVJcGFVmF4HxqyYJ+I0JhATPwx6z8Le7duDLn8sjCUpPkLDd/RbcOgBdePohiQeAkrY
         pB/EHk9pMPEiAuFm8PLE1RCDDRUu7LDX9ZyOCdid95lzC0o2xyKxKvxed9luNYWvbbtp
         YOfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3ziz6CecR4U+L/1gr73lfPjLacGX816ewsHilyUuUIlyoOp6gYN1yOapePzSC2TGeKfY2gId08Cw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzY3EHQpUUpphyKFrLRBtS/X9DHInfxEbqY/aVMFloTaj9Uk6xn
	AMZhMmPtsxD8ZP4g3XPxWrj3H9FEmJ6edvoggeUhGfkXI2qufFMjlEVmAjF4XgLI4FptM3uEtoK
	EQizMIm69Uxs+zeONH9Zj2zLqB1NMCjFzMBpaEjkssa/J5f21NUEYdKOAPcGZNBR0p4HpugFbNF
	YO768I2rOcxFY1DaMW37LChfXLf5H52ymgTsdNO8/Vk9Wf7SyAwUJqYcCZb2dcQ3QRaKECFPkwF
	7K0ESaCBVvFVoiRxvHMrA==
X-Gm-Gg: AR+sD13L+GB0UkTjzC+WcQvY24yMbWTEjZJ50z65KGFYG8c4en8L60C4WIc5QWHrPv2
	EMbkQF6hSdbxiu9MDMqhv7/fvg1eZvGn/PiAKqA9CG+TgnbIEckj7BDiOfCDtridkALlTnvfU9S
	GbmA57qHZHJdqAVLluCerVeappp3F72lV5LFHFgSMLGFHIYH5lKcxCqD40rTFczGDedWWfT6e/k
	UZFVfFwKhRd+U022mjxHeF8o2cpBGhQoV5Oubz6RbvZ030dCuAz+W5fRyaKU8atp2hEN8scWhAx
	BEG4JCBZaXgiohdzcr5XGVZSJakcd6SrKTeprZbmuznyJKc8ITBvjH9GPr1Bjtf0u86h9nf3DsV
	+QysVGB3rXBVcnwR8NsWizGtjzQkekuChgVwP35Q7F6VrGAbv8KPNCfARDH8XjP1eNvYhK+Fri0
	mjGLFyY5zi/0wNGKxaY6PjR3QOt4IcBNfjudlPYHk=
X-Received: by 2002:a05:6a00:a214:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84f2e06876amr4375774b3a.20.1785909919819;
        Tue, 04 Aug 2026 23:05:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cbe708e280fsm464674a12.6.2026.08.04.23.05.19
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:05:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so6024811cf.1
        for <brcm80211@lists.linux.dev>; Tue, 04 Aug 2026 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785909918; x=1786514718; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixvJyzHf6CwQR78Vnc98OrtjL5Qm3qHKniNH1npgOPE=;
        b=bHD56ZXNw2JB7sbH/rkUJIwfrv+ozMtXUCzxaUOV0zzE8MoQXIS18P5Ov07Y0haSVE
         92eLwOup7Wy8eGG9XSSyLNRTvC4zXS8Ze8DAhdBDjqpZtwD5ughpOwKA+vNEcRL6cvOy
         5/nsQ4iprgCdE0kEmOKYG+cx+ofB3e7/z2nUY=
X-Forwarded-Encrypted: i=1; AHgh+RqhdISJWEleAKRIsXyvg7UvnX1wXBxmq/YXD1E3dnrtbygvfeg44tnUzhZBE04n54OTaBQ7P65CQ3Q=@lists.linux.dev
X-Received: by 2002:a05:622a:a06:b0:51c:844f:28da with SMTP id d75a77b69052e-52ce5f8fa54mr48932081cf.5.1785909918311;
        Tue, 04 Aug 2026 23:05:18 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:51c:844f:28da with SMTP id d75a77b69052e-52ce5f8fa54mr48931731cf.5.1785909917851;
        Tue, 04 Aug 2026 23:05:17 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce8975b3dsm12228941cf.30.2026.08.04.23.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:05:17 -0700 (PDT)
Message-ID: <367ced51-be75-4e21-8e8f-6ed31331a0d2@broadcom.com>
Date: Wed, 5 Aug 2026 08:05:14 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: brcmfmac: cyw: pass PMKID to firmware if present
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260804060859.412348-1-bogdan.nicolae@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260804060859.412348-1-bogdan.nicolae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 04/08/2026 08:08, Bogdan Nicolae wrote:
> Zero out auth_status on initialization. Otherwise, garbage will
> leak from the stack to the firmware (when ssid is less than 32 bytes
> and/or when params->pmkid is set). Then, pass the params->pmkid to the
> firmware (without it, the firmware caches a garbage PMKID on successful
> authentication and denies a subsequent association request that includes
> the PMKID).
> 
> Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
> Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

The checkpatch results on patchwork still show one failure [1].

Regards,
Arend

[1] 
https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/build-wireless/1139831/14729070/checkpatch/stdout

> ---
> v4: Fixed indentation
> v3: Added Fixes, Cc: stable, and Acked-by tags
> v2: Split into a separate patch
> 
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> index 873754be5..2c59b5e57 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> @@ -200,7 +200,7 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
>   {
>   	struct brcmf_if *ifp;
>   	struct brcmf_pub *drvr;
> -	struct brcmf_auth_req_status_le auth_status;
> +	struct brcmf_auth_req_status_le auth_status = {};
>   	int ret = 0;
>   
>   	brcmf_dbg(TRACE, "Enter\n");
> @@ -208,6 +208,8 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
>   	ifp = netdev_priv(dev);
>   	drvr = ifp->drvr;
>   	if (params->status == WLAN_STATUS_SUCCESS) {
> +		if (params->pmkid)
> +			memcpy(auth_status.pmkid, params->pmkid, WLAN_PMKID_LEN);

The line above exceeds the 80 column limit.

>   		auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
>   	} else {
>   		bphy_err(drvr, "External authentication failed: status=%d\n",

