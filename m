Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE11547D4
	for <brcm80211@lists.linux.dev>; Wed, 21 Aug 2024 05:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724219312; cv=none; b=enDIdrGlsR2UCsEGaDfJhRw7CXenHZHSOhr1NiltBAqLAm9Gbd2S7jTGib+wYJJKG42dH0DMYhyPw3xWX0itoMcbOyli7INaTt8akLVfPtVLoIZaSpLN5S4q+Fgf30s+OPGQF9/CmvfmpVp65DNRXxvZBjx/5wIJvrlNXoqzWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724219312; c=relaxed/simple;
	bh=J8x2jVHv24gpsGk/rvne1vdojygWNGLZKnDuhBA0KeQ=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mlrDYf7ZPrbgN1L0TdVYCjRcJ4C2NFUIsUOkMReQsJx6Qk2DlsoKkc+kcbe0Q4yEhIeMRHYE2+Bby6+u5cmC5D4WoPH16OLJ+Vnf8Lo7aagnwuYx++cXZ6AUnWJr8GthUfJvq4NgUhwJWx1uxpI9AwrIqGQMdWoEuU9L70abjUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TqpYODWv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TqpYODWv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3718acbc87fso3365238f8f.3
        for <brcm80211@lists.linux.dev>; Tue, 20 Aug 2024 22:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724219309; x=1724824109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nP3ueLvKs0/bHziLfGaK4Ey7cdFOtLdT2RqpBOJBVJE=;
        b=TqpYODWvt7fYRKkI3BKSfXwo2KoK4t9Z/6zXiHvfeLiAoS1CASxaAZfOqoQWm4HEMy
         3t4J10hU+RBcvyl6zonHrXLzlXMqPhhI34JNZU1ewM3T20cfMQKT1N3jX5CXwDn8foV9
         p0jnj8i8GmizE8miaYAuTNFAsSJJ05Z4k+LaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724219309; x=1724824109;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nP3ueLvKs0/bHziLfGaK4Ey7cdFOtLdT2RqpBOJBVJE=;
        b=XhM59+Mt2/pjmozegdQfnMKY3ix/uPY/VhYKKgJK9fW9goj4EYgTwSlrXY6muvAUWT
         JoOF5mWfv+8Kon6itRUMrTnVkBAz08dftHh1jw5QOrzoXiwuXWlF7Ll+Y7ggQrKhFg3H
         jHVk78MR+S+ViO7oBFe1CU8HCyU1V9HwV3AA8XmZjz22aiWzVZOwaXDlQP3v9AdeXLSV
         RhqXP9ccJJhkvf8xh0toaiN3q0/05MF9MN3pxQZj1BLQ9viqFHjkjdQ8CMFdna1djmEm
         dorbJm044HDVlE0OHVGkxpcOFxH0MgNE10By0WIhvABe/HcX+7RejIRIXh4438ut++fp
         rAbA==
X-Forwarded-Encrypted: i=1; AJvYcCXJirTkINQA8lprjQ5zA8sU5gjQtmfLd/cP5yvafc3d40crnnpEzY5MpaqkP9HY73MP3ISRP4U912Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5by8xFRPnhCzy8K5n36EPRPywzOYZIEjTJwV0P5/nuPq5tIWX
	v4M+IoLt/I3uqUIyFSRXdvc5WGLY25gDiMGKjE4OrRtufpLktZp6gYb5MJUdaw==
X-Google-Smtp-Source: AGHT+IF9gb11komyzhf6yHRSBm6Bx0StIFXfTyJUrS6do+skd7QbjRTWFyt+VW82Aiajp3akvAAfJw==
X-Received: by 2002:a05:6000:4593:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-372fd576901mr551215f8f.8.1724219308299;
        Tue, 20 Aug 2024 22:48:28 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm847323366b.166.2024.08.20.22.48.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 22:48:27 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, <kvalo@kernel.org>, <johannes.berg@intel.com>, <emmanuel.grumbach@intel.com>, <erick.archer@outlook.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Wed, 21 Aug 2024 07:48:27 +0200
Message-ID: <191737a8900.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20240821023325.2077399-1-ruanjinjie@huawei.com>
References: <20240821023325.2077399-1-ruanjinjie@huawei.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH -next] wifi: mac80211: Use kvmemdup to simplify the code
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On August 21, 2024 4:26:17 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Use kvmemdup instead of kvmalloc() + memcpy() to simplify the code.
>
> No functional change.

Comment below...

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
> index d86f28b8bc60..7717d7764d2d 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
> @@ -1611,10 +1611,9 @@ int brcms_ucode_init_buf(struct brcms_info *wl, void 
> **pbuf, u32 idx)
>  if (le32_to_cpu(hdr->idx) == idx) {
>  pdata = wl->fw.fw_bin[i]->data +
>  le32_to_cpu(hdr->offset);
> - *pbuf = kvmalloc(len, GFP_KERNEL);
> + *pbuf = kvmemdup(pdata, len, GFP_KERNEL);
>  if (*pbuf == NULL)
>  goto fail;

This is the only jump to fail: so instead simply return here with -ENOMEM 
and remove the fail: label.

Regards,
Arend

> - memcpy(*pbuf, pdata, len);
>  return 0;
>  }
>  }
> --
> 2.34.1



