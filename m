Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882927A103
	for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260256; cv=none; b=uxSHb+0YFVtSkvbIvvxJ/sqLoYsHW+EshXvVUrpeoUT2q7I3tWRntLmjdSWCFVifCnJ3ToKM8V1MOZCGG1Qr77GGQ6hjm987jaonjWCzmeTxTwpP+X2YttUaOg7JXBUnfheHjlEgx8ROkPr40CrJyoZai6Ub1rswmXybtzz13kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260256; c=relaxed/simple;
	bh=WVittBvUo8cCbbunm7xGONFFTiaXociDe98Y4I5I2xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTigu0xKUiImBsOhIsJJhfnmFt6lFP0pjxDREZraxT68QKvKnNH1aywYHYibpQiT24k3kZSrhywE1gLr7udZ/MQdC9BPn03Lnu1nHjhX6DNgn5x2jaOEXzmVogBYdwDDK3OPxg4JGCRkox3h13nZEqfxmATdeRObmEm5z1IIFZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PTA0gTd5; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PTA0gTd5"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e278d8345aso619523385a.0
        for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753260254; x=1753865054; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eUbxncqgui8cg4e9QdhgKjwrTGgMU2+j/6biSS2Wr3o=;
        b=PTA0gTd5YTUCc1lrVqoodMcWNPe6Xdr92W3bNVeSRDmJ2o8PpxgKIx6VGeN+PAjmYn
         KBq9eE8RXbGSWHZ2BXQ6F9IqwkjKBRx5d16WTTqnhP03sGeE/ayKPJttEq9BLxZCUfu8
         8P1sLe082G3KM10J/em4D0GOgbDILrkWFdEw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753260254; x=1753865054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUbxncqgui8cg4e9QdhgKjwrTGgMU2+j/6biSS2Wr3o=;
        b=wWh/VwYVq4ljLEyTWp3OT9o4pSSbugqsjV2gbDqAQAQZDd09EdXbU+GqSMuTPkJYuY
         +3piosaUU/fBGDBxoJPq+NSPRolbUhRkq1jQeXKuKQrOJhwb6rVRio83c3lmOXOIZR+E
         yX6C/1flBbfngmc0020W3KmVtNJGgd1Uo8GVZXR9AtRCTIbH8SKkncn9c45pN8AcjX1s
         +sXaSDqfowpfwb6I+DnsSEwa5p78SZZ3eNUNXPNotDeg9aF9V3c2SIKqZBiV0BsuFLxy
         yD4GJbcFc1w91nykbvR/zxZA9DGwJu+bN15D5gA06ysyXdkpenrkCHzXh9NvcF1wTm7h
         iPPA==
X-Forwarded-Encrypted: i=1; AJvYcCWfA0TtUymz0gZaGK/t3ZVk8lg1GKGCK+tfcwREApRPrLfxFJV62exb35frhFWxCzSBiJT3enEkQow=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxaf4+rudz1qhawHtQZzqZEhv5heVcSpWNu1VL1+Yn1d4czNmTj
	jxoPA3STpPvCzuZ2SY2V5DepmUWu5vRLBRHthKLWyUKDRs/zJUPxlShJ3wqo5IVq5A==
X-Gm-Gg: ASbGncswWu/xu8K60GVKQ550WP2ZU5ntVCrsbbGdXFpa55ZTRjsATwrK5SYloSjX3ru
	k13oJZKPp3+R6mNobMiTNKrLEe8Z8cdWajafUmBhA4zICCn9Y6Wz+RgDN78jlFCBFIoaKAYNQ3c
	+RXdwi5HE8ld9h4bDKV6IgUbygkQC+86v6NgdXd0wDaeg7xghylpz6sm0kNL+sUqrsoF2IgjMUs
	WRbM2lYyQuQzmScs9IWJxQ455tbYEj12gkwUn3+Qc//S+N2Cu9IXiyENnktEWPl1WHDKEONjbeb
	EtQQhC50v/4ePYf0/Fv7M+MTlScmmV3Z73bltvcFelnQsS6G73XASj3aUkdQPJ6RxQDXcuajGRf
	fWxSqKqRyg3DK4CG/xj6btYodHFwcoa4DMii7kFZFQ59Sgvp1Yjf4
X-Google-Smtp-Source: AGHT+IHOWmWlfk8kH9RBo2XZP7T3Fup5j8wp5NczajHeV8KaLN1TrtCQzem0unYAynyHHbUbAaoP5Q==
X-Received: by 2002:ac8:7d02:0:b0:4ab:6fdc:70d4 with SMTP id d75a77b69052e-4ae6de72667mr28783791cf.20.1753260253366;
        Wed, 23 Jul 2025 01:44:13 -0700 (PDT)
Received: from [10.176.2.145] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b3106bsm64954691cf.60.2025.07.23.01.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 01:44:12 -0700 (PDT)
Message-ID: <89c25e60-5e35-4ec6-bb3b-2f7fcfdc168d@broadcom.com>
Date: Wed, 23 Jul 2025 10:44:09 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 RESEND] wifi: brcmfmac: fix EXTSAE WPA3
 connection failure due to AUTH TX failure
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 wlan-kernel-dev-list@infineon.com
References: <20250722044515.2562-1-gokulkumar.sivakumar@infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250722044515.2562-1-gokulkumar.sivakumar@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/2025 6:45 AM, Gokul Sivakumar wrote:
> From: Ting-Ying Li <tingying.li@cypress.com>
> 
> For WPA3-SAE Connection in EXTSAE mode, the userspace daemon is allowed to
> generate the SAE Auth frames. The driver uses the "mgmt_frame" FW IOVAR to
> transmit this MGMT frame.
> 

[...]

> 
> Fixes: c2ff8cad6423 ("brcm80211: make mgmt_tx in brcmfmac accept a NULL channel")
> Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
> Signed-off-by: Ting-Ying Li <tingying.li@cypress.com>
> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> ---
> 
> v3 RESEND:
>    * Resending the same v3 patch for review reminder, after adding additional
>      mailing lists in CC.

Please do not RESEND as a reminder. It creates another entry in 
patchwork. Simply respond to your original patch to ping me.

Regards,
Arend
