Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF01C1547C0
	for <brcm80211@lists.linux.dev>; Mon, 20 Jan 2025 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737394501; cv=none; b=eIs0rzUxrO9ihtzHzLLWM76IVEQCLnSx5Fd8knPtY/2BjOLvl2ojV4IB9dtaT0xwBaJs78oiCasFuj2/Z+48P9Vxszl1En/YIoT304qhE+Ur2LqTVayImq6ByHS3HMBYnJweYQjOkwOS8mJFWHqCx3uDr7YCHJmzZFtwEIn8TNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737394501; c=relaxed/simple;
	bh=6d66yM+xgDJutwLyOnyWoIMPVsEQgmzcnobANBv9S4U=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=SH3QNW6Ec6tmdYASDR57KUP74Q3+Oec1VAId8O9567fwWk03JdHF637O0ywTp4I3qbe5PutJ4e8jcDSIzJlpWG1niebfBrJ+3DDQUG/7TeAhZMotKHv/UGhatK/DgoFGWbpZKQnOKS3OYKwOamOiqwWo6ThXzC79ywcDMLdULrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U10ix8kV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U10ix8kV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf60d85238so800467766b.0
        for <brcm80211@lists.linux.dev>; Mon, 20 Jan 2025 09:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737394498; x=1737999298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5kQ7bmCIJ8FWDhkXOqLPHsLOMSM5XeSP5R6rXiP8aM=;
        b=U10ix8kVF2O0D/B7BnnQyTOTwLnW9TwqVj501O+V1WbnYPD7x6cYp60BRN3b6iay4i
         0QXVnTg5M0lWY8qYE5ERtrFvntL1J0qWUBPX2zw/YHhJtL/CxFyAQGlGrwpafSt3X739
         FPrw0HDH/2b2SVZAYfB6NSulzvDpggz5GqNp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737394498; x=1737999298;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5kQ7bmCIJ8FWDhkXOqLPHsLOMSM5XeSP5R6rXiP8aM=;
        b=qK0ECpcKPBv5X7RW/RRlMolvS+6/kK5kkBu5W+zY3P8GlM27wQUUN4s8rUpngvlQGU
         0Xd6pC/s0Yy5nXlzpkNud65VtP69QGGvnWrd4PlftdHWxVy1jcaYsrMRTdh0IvwEEzQg
         gfAXRxeIVUyiPWS6kgp36D05VLXHpp2vq8nx2fuiLiRKtTiAl2yTPQ2NdVh+W6Vv2R/d
         nEMSAL6Voa8rlLxZkF1hPL2m5m6hMkCfNm9HV7muCoUQxI0T2Ih12M4yDdNZ6pl6h5ef
         DSb97u5cz22FU1IsoPKt7OVOyblCtenrpnfe+Fc9zkBKILyHiyQ+n4mmrCD71d3DNXmV
         37ww==
X-Forwarded-Encrypted: i=1; AJvYcCUYqoWPXeWhY//W7i+yI02T24IJMlkBdWyKcYiMXkBU07/BC+Y/LQx+zaqXIQz72p0PPE9oIsfRwBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRPQ1Oxfz0dW5U11djutatf1MUIAZszB4dCwm8IgVy97Gxo+mH
	nLTcvIhGguaJOIEs8h40WbDiJcnO+HxtEMNsQK1ScOrTLkgZl3FamIDoWGDyr/FepJr7CytlQ7f
	9qs9vKCg=
X-Gm-Gg: ASbGncutlUo4+edKXXJvWkbnNfLR9AfR5qrgGaEB5rOTVwqqc/gB/dbPidolRShL3Z1
	9NAVWrRIRGHsg3mpPOFVVJXrZRDylYpFQ531ZhAOO3n+UV78DcdnRx3VHHPGzpUFJyYllnMAKXe
	lRIos4De3uPCoK7F90c8OEhjvtouOBvwEUnrvUKZ/9abYmOzLruNioq+2Cu651oaEaVNNpXv+C7
	TFjvodSziSxKIjygclKjaIhNGkbTIYXUGVUq1xIXkUMSO5bbGnDwdZMfr7llrBU/2eQ5DK9VONh
	OEphu786XCwm9K9NcvjRzkpBom83tVr0
X-Google-Smtp-Source: AGHT+IF0K+J8L23wNoj8Xuer57iaUxyiwZ3Xud8AZbBiC/3nWRn0xLpD+DOJ7xcc4zZ/mjTqKzGjew==
X-Received: by 2002:a17:906:794f:b0:aac:1e96:e7cf with SMTP id a640c23a62f3a-ab38b2003e3mr1061679266b.20.1737394498072;
        Mon, 20 Jan 2025 09:34:58 -0800 (PST)
Received: from [192.168.178.74] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab632fa9f6esm53544466b.115.2025.01.20.09.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 09:34:57 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <gargaditya08@live.com>, <kvalo@kernel.org>, Hector Martin <marcan@marcan.st>, <j@jannau.net>
CC: <linux-wireless@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Mon, 20 Jan 2025 18:34:56 +0100
Message-ID: <19484c82200.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <06B76E82-BA57-4195-87E5-B0935BDD4EF6@live.com>
References: <B606F666-4A6F-44D9-B956-0B3E88E286E9@live.com>
 <06B76E82-BA57-4195-87E5-B0935BDD4EF6@live.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [REGRESSION] Wi-Fi broken on Apple MacBook Pro with BCM4364 Chip starting from kernel 6.13
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On January 20, 2025 5:56:35 PM Aditya Garg <gargaditya08@live.com> wrote:

> So it turned out the changes in the following commit broke wifi only on T2 
> Macs with BCM4364 and BCM4355 chips.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/broadcom/brcm80211/brcmfmac?h=v6.13&id=ea11a89c3ac64ada9d8b7f7de279cb6385ed194f
>
> I’ve sent a patch with the fix here:
>
> https://lore.kernel.org/linux-wireless/47E43F07-E11D-478C-86D4-23627154AC7C@live.com/T/#u

I saw that. I briefly look at the kernel log you sent, but couldn't draw a 
conclusion from it. Great that you looked and found the culprit. I will 
acknowledge the patch.

Regards,
Arend


