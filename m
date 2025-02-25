Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74225744B
	for <brcm80211@lists.linux.dev>; Tue, 25 Feb 2025 06:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740465007; cv=none; b=EgTKzcj973r8MDq6X0VnJ3vicAtnR9o1k/sSZi0bWYrMSYL9D3Uav3+CM9bv1wn7OmW/zE0+YOccfj/PKE9HBBXL1MYB2XaescG7sTOheI4EvC0lyxjbxJHeC6W2MOZVpZVjj73gqv9bgOkhOec6JNV52MFMD5bZDG9sCh278Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740465007; c=relaxed/simple;
	bh=RYfyD32sRASx29xi497H3XJdDF3XXVn40eOIf2rnFm0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=i2CSn7IoaqRkZs6NgXB30D1fTDv9nFt6aytQCVdP40jTtnrOy5Xrnaxv369CXzPQFi7iNbaR6SsFZYs9Du7c/oA7BTxbN2G27he5fMRCjVGtjZsuHKf0fEPWOPSj+ZdnG/qU7Jnb1kPUIqDEksKvawW6o1tH0s38E7lrZOM5SC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LeAC3jhS; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LeAC3jhS"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f40a38cb6bso2362982b6e.1
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 22:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740465004; x=1741069804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+mBAQq6Mkez/2/DMWHStf85qnBYyGFLVJqfvqnbkxk=;
        b=LeAC3jhSvqAjVvz9Mc0viN/VNnM0+8nIciH8RzPDTGMW5c3ldmQPvhU5OSYSPKTfwm
         6OwExlZs3Q8AUbG6cL4L08XuW/UMImy+ohCmcWXbAvqF4GGhLJn8MCPi+AtbrzdiIrIJ
         aKSmE5M/SNjNjRs5694z5iiIJmqaVgWrWFhgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740465004; x=1741069804;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+mBAQq6Mkez/2/DMWHStf85qnBYyGFLVJqfvqnbkxk=;
        b=BUg1zl3ZjTPu5Li9m9fcLZ2aRo08tmEBTtLG9hv9mucZgIb0kiGan/5J4tx1I9q8Wh
         /wHRl22EXXdwpoDeWtlR3cQes00ZWv+i/xwgJGxbk2LvenFWCwJmyjaP65YuYilxkbHu
         z9B702QT0Mbx38EbUujmdGYygDPJhN+1ckmMZw72P9q4GaUNqUmAKovEfca5J5UVzkd3
         DWh/Mr8/NFbD1Rdb884FaAaX7a/fZmgcAkQKmZsXbrqjg/YiRK4CC+VxcxvmI62CoGrt
         6xJ8Mq3im1P1fz57zjgnV8hs+uOS6griczAmHQqQnzH+BnNn8QM7aF0yEPoVE3SjF9Za
         ujRA==
X-Forwarded-Encrypted: i=1; AJvYcCWAXP3PlwISin1aSLxeQcBWhoaPV2jA2JRYxoo4W2mNJ6QsJ6YSfIpq35z0OV4zn4wBuGHY/fnivvo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgNj1X6NqATTqmjEoACRQ9xjEfLikhuqLH5FC2wm9nvr9kEsXn
	dJcvh+deI8tgiXTe5wygynHC0kOLG3hsCPjfr6VDh78b8+oyIDMxARxVMgbDTw==
X-Gm-Gg: ASbGncu9M8D0jQqPSnjmO0VkO3aUnVu+Y7gz0vECOpdSIussRH7hJP3gVwtv7x++p9C
	z0wClDy3TigbmZV+jYDyByycANw18vxztDHSt5uSAB8gsChM1stUeIFoYbByhSZUrRurNgIouUy
	B2WXEj/mky0/gDMlqcWmLzeJDY6nbVmA9BA7piPTLFH47IKk+ACbKwzU4AlNs9pIA9Zgao9TwTI
	KIdvPfY8rTSuC91SK4Q5ac565DVGHQ/0i5rdCIUQfQCQP8XJF5mi3X92b7i454dHA+gTwyGr1Uu
	vypAdKPGkf9aJ26DwBQvHFstWnOL1GkQXeDA45WLYj3irVqE1QGhaDns1vXXXy9Q
X-Google-Smtp-Source: AGHT+IFdXMbhGx7fP9GFKGlpguOITWaZZGOBzMRAt9OnDAJpr0Tf6LoZNYE9WcUj4WMJOinaxdWK7Q==
X-Received: by 2002:a05:6808:3c8f:b0:3f3:e8e7:2001 with SMTP id 5614622812f47-3f424777eb0mr12305946b6e.26.1740465004283;
        Mon, 24 Feb 2025 22:30:04 -0800 (PST)
Received: from [192.168.178.74] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f541bd992bsm190300b6e.16.2025.02.24.22.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 22:30:03 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, <parthiban.veerasooran@microchip.com>, <johannes@sipsolutions.net>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>
CC: <hpa@zytor.com>, <alistair@popple.id.au>, <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, <oss-drivers@corigine.com>, <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, "Yu-Chun Lin" <eleanor15x@gmail.com>
Date: Tue, 25 Feb 2025 07:29:46 +0100
Message-ID: <1953bcc1790.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250223164217.2139331-12-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-12-visitorckw@gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH 11/17] wifi: brcm80211: Replace open-coded parity calculation with parity32()
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On February 23, 2025 5:44:54 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Refactor parity calculations to use the standard parity32() helper.
> This change eliminates redundant implementations and improves code
> efficiency.

While the dust settles on the exact implementation from driver perspective 
looks fine to me so...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
> 1 file changed, 1 insertion(+), 15 deletions(-)



