Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A251287506
	for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 09:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753263688; cv=none; b=ZEXKOir49/R41dk8QycRrOlgMdcOTL8q93h6D8bJ8ZYJJIHGQl5MbfrHEvlKs248VYizpwi10bAusU1ZgFgMn/qy4F0H0iL7Mq//hqF7t78lbO/6yN2aUWgb3ijd8zGJEgDWplR7ZBh+VmScKShYbd+b3J9AXCMzNiybfVTm6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753263688; c=relaxed/simple;
	bh=Fpdmetq8rTUEqq9WkszaFi7bbWvejmQcpH5dX9vmY9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWekyQzLc+MVv6CmCdUvtHLwhbfKw9VjSLYsFMHPu1tOtOt7ueaz5wnP/D8AlbZKRfOsVYirdu8+hzPCw4PcEaDyhW+Oe4Op8+I3nIzezo8jTj/hcUMax+ipmXS9LMzrRCygvPWsU4df+fNiJ+E4pocFN2s1ARD2cOM7GmMRXMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U4xGA9oX; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U4xGA9oX"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab71ac933eso51909311cf.2
        for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 02:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753263685; x=1753868485; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DQm6k6GRfRb1Tj7sFMA4AF0xS4uSgjz3/cpurFAQcNU=;
        b=U4xGA9oXRC/JAQQmUhkhS+KjmYKH7PBQV2KMViynxzyfw0Mglp5FK3lfRwMXAfFS96
         2FxbI2Hd2Q0JfMiSDDhiMdxvZbclZU/QvKvDz+k8IR5YzBe0NUAXI+XNdk5Rhw7jbgZh
         XR+A6cYvhI+TABL+eimCTGOs5zOmJdjiLJA8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753263685; x=1753868485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQm6k6GRfRb1Tj7sFMA4AF0xS4uSgjz3/cpurFAQcNU=;
        b=Fas7fpY2w/xSm0uoMVz4YABrIZlPxBRP62XHrpCL3jSyTjd0On+IKMfikNyOtyGSk5
         qXw8tLR3+jK7i5ZLtWR2xo0DGD5+LaHg1NrbFNijj4uoY3eBsFoTYfqwqlFs+4snltCX
         GTMn6NzuX3kVKUi7Yu9pqRDYGZmC317CWYAdejIqYAl/6eDx2wi3PyHoSzkmB2R0wnI0
         mCwzEN+Sh3RJ46NDbrDx03Nf1mI9cK9rt2+B3xAaN1pP1Lqe+lMuMlr73smcbMMU4oqJ
         xsU9oI5rU52me5CJEDJwH0ukIe26B4iyb0Nr+nDhbPgW5VvsHLpsy8rjeq8v9osKWjVk
         ouuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzgP0zvXnO3fHBs7IaUTFi/9PhZLde0x5/f7yZcqdpYu+6B00ckk0jC+YGuGohBWJlrtMp0QCPvuk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfIEUgvHi9BCUsZ0XqQMkspVBXIzkwZIdcz+B3nrRC333/n2f2
	ZPD+pD3TD9QMyI0ZLf33+Y+Z/OSpma3EurIcYCvmJa4Yu5yfrrFFbELklz7i4qnTyQ==
X-Gm-Gg: ASbGncuKU4TycrHCewgDuozeXPmzhyR+WerYnrJfbXIzUvnCZrQ31j/GUeMQStMSzkH
	ZwQhhvB8Js2egFWsRNItrvf1GkHLduYrHTzRoXUjGDo+W8NnjXATAhibjiASshgdI2obzoz9EsJ
	4ypbwbhzz0B23qmd9W/FbuGPo3yDBc4COolZAHtsUwFyOigTVtk2e73ENkQu26t9YLbjt7oxoB9
	DKKENj4lArZb9RQ3LT4S/GkTBApm9pb3A8HjJTwcnVraYZNkkDUb+qR3RrriQAa30UaP+JUILXd
	x4UQqdXyrGixW4TNObvZ6A/1kFgNgYPqbRQRhFuyNadeMGT9VBUqTvamPiU0lXk5YbpnPy3yMxH
	yRA1GwquX0keRK6X3HX3nYeJ/7jzgkB36k/zMIOpblbELfSElseDd
X-Google-Smtp-Source: AGHT+IEHPgcqDK0ElwBxJD+Ct77IecKVvreRBKmNCknReGOOR5dFBvm5oE5wCWsiVBuPzM1GPGxc2A==
X-Received: by 2002:a05:622a:164a:b0:4a9:85ee:5ace with SMTP id d75a77b69052e-4ae6df3f69fmr29212481cf.31.1753263685416;
        Wed, 23 Jul 2025 02:41:25 -0700 (PDT)
Received: from [10.176.2.145] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb499fcd2sm65370471cf.17.2025.07.23.02.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 02:41:24 -0700 (PDT)
Message-ID: <96fa566d-120d-4501-8926-df3a76854116@broadcom.com>
Date: Wed, 23 Jul 2025 11:41:21 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: cyw: Fix __counted_by to be LE variant
To: Kees Cook <kees@kernel.org>, Johannes Berg <johannes.berg@intel.com>
Cc: Chung-Hsien Hsu <chung-hsien.hsu@infineon.com>,
 Chi-hsien Lin <chi-hsien.lin@infineon.com>,
 James Prestwood <prestwoj@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ting-Ying Li <tingying.li@cypress.com>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721181810.work.575-kees@kernel.org>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250721181810.work.575-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/2025 8:18 PM, Kees Cook wrote:
> In brcmf_cyw_mgmt_tx() the "len" counter of the struct
> brcmf_mf_params_le::data flexible array is stored as little-endian via
> cpu_to_le16() so the __counted_by_le() variant must be used:
> 
> 	struct brcmf_mf_params_le *mf_params;
> 	...
> 	mf_params_len = offsetof(struct brcmf_mf_params_le, data) +
> 			(len - DOT11_MGMT_HDR_LEN);
> 	mf_params = kzalloc(mf_params_len, GFP_KERNEL);
> 	...
>          mf_params->len = cpu_to_le16(len - DOT11_MGMT_HDR_LEN);
> 
> Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")

Thanks for fixing this.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>> 
Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Johannes Berg <johannes.berg@intel.com>
> Cc: Chung-Hsien Hsu <chung-hsien.hsu@infineon.com>
> Cc: Chi-hsien Lin <chi-hsien.lin@infineon.com>
> Cc: James Prestwood <prestwoj@gmail.com>
> Cc: Arend van Spriel <arend.vanspriel@broadcom.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Ting-Ying Li <tingying.li@cypress.com>
> Cc: <linux-wireless@vger.kernel.org>
> Cc: <brcm80211@lists.linux.dev>
> Cc: <brcm80211-dev-list.pdl@broadcom.com>
> Cc: <linux-hardening@vger.kernel.org>
> ---
>   .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
