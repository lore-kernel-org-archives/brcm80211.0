Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9174C14830C
	for <brcm80211@lists.linux.dev>; Tue, 22 Apr 2025 04:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745297765; cv=none; b=irlrK6v3sjYzrxEBe8kbKpySWEF6ELOLFoas/kagnkhHG2REz/HqY6//4QevBA6EyHIExqvBPZM5rrcJBUQjjGzOugPyG9T7gXf8pfWcoE7VBzOY8uc6kREwmByeMmKW+05ErdpJNYNRWpj1HVSHt+EM6trJ1fuj8Czcq521+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745297765; c=relaxed/simple;
	bh=1n6VFvcqcUzVl1/IbVIv/Pa/793Z9OAZn+Q6I6OUYBk=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VzGWVw/zZmG7qAXt8Sr6jLnvDmKLfQRTqHgqfpC5+9cc6KFJOqot2OsCnvuGAEVU1A3JnlagsOKM7aZ9vet5zQ7NESWD7uoZ8K+Y5p1AJhCO/EN46Mapav+RcQDgA7Oy2s1TALJiqghSXhe0MHHxg69SmyHeq9JnDAZZTuDHneU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ekqk5Onf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ekqk5Onf"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so8002112a12.1
        for <brcm80211@lists.linux.dev>; Mon, 21 Apr 2025 21:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745297762; x=1745902562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wrp+glrqMEFQIOcbV8OH0y2t9hGyNvM/0gI9W80il2Q=;
        b=Ekqk5Onfk+RRdxrCPwNW2NLx6AFyTZmd73w9ZsjD0ZCql3GQFbyo9PNA7s8wTBLgKP
         k2+zCZzad0vdiI7iQis6Op1cW+SgCf3+pzGyFlU4bKswGDvHGP4mI7pULMpWNDbvU2NB
         +cOwZLjc1uKhwM3yDS6HSD6LTdqyqoTSqV0dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745297762; x=1745902562;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrp+glrqMEFQIOcbV8OH0y2t9hGyNvM/0gI9W80il2Q=;
        b=DJf8jDOpZhOvhGGJOTbO9E3d+lG4u6QGencLhVd5gLWA58IeVPVdSh5jFcadNYmskw
         vRUkdZpWtq/bzV4vgM6GKJ+ZS0f49C7K8MxuzgA72tuFjotjMPuNadGaJc5J9WR65knM
         n7u+gWM23W9YTsI9u/vz9KHpsSPSGqxFU5sFN2hii9o8W2aeSJwty1XgoTqCjRvMImiy
         po7TvWMNzxyoNT2Ksh1IxDy/p+XXoq37Lmfh67ExaT+pEmTMQ4W95tjNMBrWzpXOrRXP
         RTXjIk+jRRmt6ThvoHrYSRYoTyc2tWqhdz1hc+dI+RGLBPkuBh0znKSvArepg6hgXH4w
         xg9w==
X-Forwarded-Encrypted: i=1; AJvYcCVtBEIpOYL+geszzZ0RVxRYwEgc3BTgw3B4/+ZjkxoQvUZIwpskXipxF6shCE9tiYiCvxIDAwenIvM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYccIvMchMIBR9BJy4TkD0RB8UIXFYWDkqaDuPIP9UkxoEtBst
	yXpAM71ndJJl07ZKaciR9xPQuXlfPtfkSfet4guDTMBVUsPxWt24jttu5DMJnA==
X-Gm-Gg: ASbGncsER7/DeTqqN1s7fvoef7KXwV09+sGU7zmkzGNVANOl0wxk84UdgiW7F4PRxZO
	C+QwW7GVXBYcCfcKczlXVcttQkUN6fUDwmW0XogOO0QGZDpQrPjU2mZptbieAGTNL/lqWyQF8eM
	dfHvdgawDLkJSSSxI0LRkLia83qTD3ZTRMP47a3ityILa7+b3IKR7YHC+BgMoYVHlw5KNZcl3uZ
	+RRWobmqzi6AV9fXZsnMgThsRKwoo2WmyM08V/UW3DWXCbQuTGl1FiiY1Ja/FtvV+BstjC/ox6w
	yMPBbCu6aWa/SpdHdGi+y1sGaQhwSzjAi2+zeAVCP3vJyVBpUmKIyUUBfHqlDdQKEkBfWteWgLn
	BX54=
X-Google-Smtp-Source: AGHT+IHSU6S5KXFU9LqzhGRG+vKu9XggFzpPIOcZPwBxuMXIbI8vYSXr2SAHZ4O5/Fg7JR4/K6GtBQ==
X-Received: by 2002:a05:6402:13cd:b0:5e7:2871:c137 with SMTP id 4fb4d7f45d1cf-5f628548a18mr12182351a12.14.1745297761855;
        Mon, 21 Apr 2025 21:56:01 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258340c8sm5392034a12.58.2025.04.21.21.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 21:56:01 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Wentao Liang <vulab@iscas.ac.cn>, <kvalo@kernel.org>
CC: <jacobe.zang@wesion.com>, <sebastian.reichel@collabora.com>, <christophe.jaillet@wanadoo.fr>, <erick.archer@outlook.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Tue, 22 Apr 2025 06:55:59 +0200
Message-ID: <1965bda5b18.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250422042203.2259-1-vulab@iscas.ac.cn>
References: <20250422042203.2259-1-vulab@iscas.ac.cn>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v2 RESEND] brcm80211: fmac: Add error handling for brcmf_usb_dl_writeimage()
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 22, 2025 6:22:48 AM Wentao Liang <vulab@iscas.ac.cn> wrote:

> The function brcmf_usb_dl_writeimage() calls the function
> brcmf_usb_dl_cmd() but dose not check its return value. The
> 'state.state' and the 'state.bytes' are uninitialized if the
> function brcmf_usb_dl_cmd() fails. It is dangerous to use
> uninitialized variables in the conditions.
>
> Add error handling for brcmf_usb_dl_cmd() to jump to error
> handling path if the brcmf_usb_dl_cmd() fails and the
> 'state.state' and the 'state.bytes' are uninitialized.
>
> Improve the error message to report more detailed error
> information.
>
> Fixes: 71bb244ba2fd ("brcm80211: fmac: add USB support for bcm43235/6/8 
> chipsets")
> Cc: stable@vger.kernel.org # v3.4+

Thanks for this patch.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> index 2821c27f317e..d06c724f63d9 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> @@ -896,14 +896,16 @@ brcmf_usb_dl_writeimage(struct brcmf_usbdev_info 
> *devinfo, u8 *fw, int fwlen)
>  }
>
>  /* 1) Prepare USB boot loader for runtime image */
> - brcmf_usb_dl_cmd(devinfo, DL_START, &state, sizeof(state));
> + err = brcmf_usb_dl_cmd(devinfo, DL_START, &state, sizeof(state));
> + if (err)
> + goto fail;
>
>  rdlstate = le32_to_cpu(state.state);
>  rdlbytes = le32_to_cpu(state.bytes);
>
>  /* 2) Check we are in the Waiting state */
>  if (rdlstate != DL_WAITING) {
> - brcmf_err("Failed to DL_START\n");
> + brcmf_err("Invalid DL state: %u\n", rdlstate);
>  err = -EINVAL;
>  goto fail;
>  }
> --
> 2.42.0.windows.2



