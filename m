Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9429C34E
	for <brcm80211@lists.linux.dev>; Fri, 18 Jul 2025 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835025; cv=none; b=OSXhQkbh/iIULo+Wh/raNwQ08pGbDCEwKFRaWjfFYtF9WIKXVZ7Hcv7itUvBTks+xA1LhG+87AxzJ0FGYuflfz+ReaivCCz0Q1PSsfoiNYiT6HRd1HFBaiYOTO+N31ZAVdNzow1NO/I0m28hFYR5IG5CDItB9WVbDWIkFIUJLGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835025; c=relaxed/simple;
	bh=o7AiU/V34b0UGWXaW0uOVGBXivX7HWYrqo4HOg5hGI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a2q24BocEdMEvZCepqQBI5L2cD68Ve/vG0Adyj31t8Xkp/0pryP8V2aqFVxf/M1YY2Y1O7ivVCm8PXixgB93js1xB7qOebaieNLAXtaF8YBRHrdssQOSoG+V/SFe2fLaH8L0rcsHzQLe7CJQ4LQtwrBT+l18y3A0yI2wJDYnLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=S8CLmniU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="S8CLmniU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so20815565e9.1
        for <brcm80211@lists.linux.dev>; Fri, 18 Jul 2025 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752835022; x=1753439822; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=be2WTQLsa5uvXybUvNfmScdP010rblWY6zgN5KBpjt0=;
        b=S8CLmniU9+mwCn3IgwY1foU6Pm+ym5fh7D5Dzobg4f91iRozdaUke8tXtGDqtevX18
         +1eLTe3m7DV22sISBsPh1WXSHXQNF8XqZ23DqYluazr3uKqQ4z+ICwQddi/WpLPUf1D6
         azXg+EU043chYrikP6wIRVMQxJRcOqcrmrRgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835022; x=1753439822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=be2WTQLsa5uvXybUvNfmScdP010rblWY6zgN5KBpjt0=;
        b=scwrMzyopLq91H6OgJFw211pXy9Lr5DaEF26C+MIncTQZclxYTldODcTponiNuJq6A
         dE2cuo3bHZ5kSK6HsLNO25KtPAABXzzRLnSbXYc5ApjhRvxzOUehepsLySzJmoF5Txc+
         DmilNef+7YSJmCVfZhT1tKSXAf0Mcj8f79xm1u7AY0BswBAauAl0VmtEZSferHyBR56S
         LSdC6VORiggA2YFHwiwtlQhlNFQIFstUzLP45IRe9pxwOftr8dRa0LBWdsnqefIp5/I2
         8P4gHWl51O58VUD7KiEuJos8dt+pQKg34ahe3r3HXMxJVvQhggA3zkMMoRjQ8LEvRgwW
         M1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX080QbQfS1MxQpkTIvRRFXAafjS/Pb2R+ra7S/WXerFMCk3w85CVoobjl20NV9CEEp2JvQ3fwYVsU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqdq/g7VUR1gE+68qhiw41cboMY2WZ3s3HEfoPLWOZDPx3o90Z
	9z4n85dhfFdF+xSCvl3t1AegpmuIJqVU7dlnQ9Lb/ztiagQ0HjNNyrgLRcZsKu1C9q3cJ1clddX
	QAy1KHdKSo44=
X-Gm-Gg: ASbGncuIrKILmBWFkCcvgGjNX4XaU2GOSLQmSryg4HOxe9e+l5i90Z9pMHXh57RFHuN
	T/JK7PramRF77m2R9VZgF1gu7oyqdYIdPCdCGTRVXTo9HDe3MKOXtjiYv0zOx8c76Hdcth9XbOT
	j1cKrfJrfaLwkcYm9WTp49cZXIHVXw9JAkkOqWqs81hb/PVSK4k429Nos1bbAgd45/+nlFoeu3Y
	H5N9tsoaGY/F63vNIToLjroJ99ykOoQ2UIoelJ9xiGcqAfPLO3R31Rl0GXvIMGqqFyvOxsKfqA7
	0SumCbcJ/612jwqVvXggJQjjN6kkzWwI43/eUwy1bIXzjiQWT9N79rKLzSkvY59VlDBoViFtl+E
	SvdL2Qd+dpOBNpucwShmm5Vohwqq02LlznflNBc2k8fL5NvdVP0Q=
X-Google-Smtp-Source: AGHT+IGaw18z6ZbgBi879Fyj3WOC2+vT3XshuuU7f+qrvOz7x5pcOoeAvZ79K/rtNQcSabe8GjOYiA==
X-Received: by 2002:a05:600c:4688:b0:456:a1b:e906 with SMTP id 5b1f17b1804b1-4562e3cbb03mr85040605e9.33.1752835022389;
        Fri, 18 Jul 2025 03:37:02 -0700 (PDT)
Received: from [10.229.41.1] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2ba0asm1461626f8f.21.2025.07.18.03.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 03:37:01 -0700 (PDT)
Message-ID: <f58ac73c-4d9d-4382-8bdb-65ac40ee529c@broadcom.com>
Date: Fri, 18 Jul 2025 12:37:00 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] wifi: brcm80211: Use min() to improve code
To: Qianfeng Rong <rongqianfeng@vivo.com>, Wentao Liang <vulab@iscas.ac.cn>,
 Johannes Berg <johannes.berg@intel.com>,
 Sai Krishna <saikrishnag@marvell.com>, Ondrej Jirman <megi@xff.cz>,
 Jacobe Zang <jacobe.zang@wesion.com>, Kalle Valo <kvalo@kernel.org>,
 Dmitry Antipov <dmantipov@yandex.ru>,
 "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <linux-wireless@vger.kernel.org>,
 "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211@lists.linux.dev>,
 "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211-dev-list.pdl@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250715121721.266713-1-rongqianfeng@vivo.com>
 <20250715121721.266713-5-rongqianfeng@vivo.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250715121721.266713-5-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/2025 2:16 PM, Qianfeng Rong wrote:
> Use min() to reduce the code and improve its readability.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>> 
Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c      | 5 +----
>   .../net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c    | 6 ++----
>   2 files changed, 3 insertions(+), 8 deletions(-)
