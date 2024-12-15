Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F251EB48
	for <brcm80211@lists.linux.dev>; Sun, 15 Dec 2024 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734284017; cv=none; b=OGBTeA3wLXXUsskJVIoH6Ec9ben28eul2M5wwFcpd2IAuugfOaei4J7TzqlZcymHtGAKbt/WDJSfhjvsYKB3Bi2ZXmuWNKZcVSVpn54Hm6GDtYj9L4M+U6z1NXyNJ4xIRSVilRuzLgkqy1SjFB8VVwUEsEV857eGpoNR0qveum8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734284017; c=relaxed/simple;
	bh=FS5b3ZtEtrlrdhN68XfcJL8gjYnve3wZU2ads3mas0k=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Ubg9ig+LSt7W1PeLgqARQQNEvaDcsu9zLcFcJMTnKZIRj70RN/LSDELr7ldXBXaP5+pbJSaH4f0lUyuVtJR6XJ0NvASwXGWO8OBDnjRvDgmCKJlUxjcnFqH7DJ5/a9up3c6ipP2MFKCTovj4l0m5Y2vWDoAm9ZO9L8RXP4haM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=coNqJMfl; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="coNqJMfl"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso6164662a12.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Dec 2024 09:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734284014; x=1734888814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS5b3ZtEtrlrdhN68XfcJL8gjYnve3wZU2ads3mas0k=;
        b=coNqJMflLbrP8xU3fiCuaZavWUPZ1uPYtVrIeWLTV+x4Tqv8wdyFuqhNCwn9BOvdOf
         DR2RFl/KvrwwBj94zsqPiPgssxMVrvMGveJ/a5wIawdyQWN5t3NKfsNu/8JoPIprUvYA
         IlIz1jc1mTJeLOuHR43Afqr7Lc+78+QTkxDIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734284014; x=1734888814;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FS5b3ZtEtrlrdhN68XfcJL8gjYnve3wZU2ads3mas0k=;
        b=sgXpUBEWKhhpE5SMPycmkADwykKuhDMOLhFc3LatAEIqLSP/V4+zNrMTYG3MuF3YiX
         KJtMgGlXHbjabTniiWuOnuFj2o09FKfdmZDsscIUy8GzEOmTvYnKl1qQ0zV2vzHJVCRX
         pnUbYdvt5wXH407aKY/zc/nTLQuv9hbCxAWoJEiH80G3/54i5V6wrdnJNjVvcr2i2DJs
         rUDdqiwLz7r+mwcuBNPZBkUIgeKVC4UIGNLbuCktbdOnjd+2yIFKwJWAtHYLUzWwo5jV
         zw+ac5M/nXdsErOpQt0BnGWGPgQzri5sdJrGLbP6j+MZADj1xfyQB+hkI5/VKswCJ5J1
         zWuA==
X-Gm-Message-State: AOJu0YysKtmAS4RkaNrGtVOabR5wFUc5iSU1WnPLEeMhnyd/49xk4AdT
	mCKcBbXargJiTORooKnHXTP1MQI6srDSFotWcJje3/qGJEYUfMkAudTVxDGWgg==
X-Gm-Gg: ASbGncuXhhl0QkUMTWffnAehso6eW97BxCwJOyFNBfsvBAwuAnQBWl2kY41tMyOuFhD
	TRMHDWFbpPkxu3zzkIuyTDXLCuUy1vgAA0c3wdZEanZne7/E+Y9URlmq/GcLhHDHQlA5cJkukr6
	Yo9j1G/vMwT00IlVaJtQdelQUApgd6Ovf74IDtTwkqF7U59Uwv1NhBUou4+QSz5OvjNFGZXYqbi
	xkXXsSWr/SHE0lOt0vEFU1EKj2wocQtAOFiwTXOxeX8rPkJMiZFKp3v1AIMhh7ogW6URXebgLh8
	75FjZb9MgckAu8Lf9VM=
X-Google-Smtp-Source: AGHT+IGuds3i4q+BA3H4MOun/bl8g8YBnInjucpDSfM1WD+kqqFaeBZkuXp09jXqFKZpbUgwzJfqzQ==
X-Received: by 2002:a05:6402:3908:b0:5d3:fcca:cab1 with SMTP id 4fb4d7f45d1cf-5d632b619e7mr10761085a12.15.1734284013701;
        Sun, 15 Dec 2024 09:33:33 -0800 (PST)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5114sm2309179a12.5.2024.12.15.09.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 09:33:33 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: KeithG <ys3al35l@gmail.com>
CC: <brcm80211@lists.linux.dev>, <linux-wireless@vger.kernel.org>, Denis Kenzior <denkenz@gmail.com>, James Prestwood <prestwoj@gmail.com>
Date: Sun, 15 Dec 2024 18:33:30 +0100
Message-ID: <193cb61e210.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAG17S_O5K4Uh2c6xqph5sUZe8gMjhD3z4FDkSSQ0dhCuZA6aug@mail.gmail.com>
References: <CAG17S_OwtNxetb7XzsxkZcygH_CWkZx15evQZkThb3WjqpiKTQ@mail.gmail.com>
 <CAG17S_M9wxMsSNyqAQv2oxaCQZ9CAe=GHNjZCbw__2bsAg1hdg@mail.gmail.com>
 <ff9c1192-42b5-4a28-a8c9-31af9765cbff@broadcom.com>
 <CAG17S_PrigpkFP=5wcTL9UETwc6aHqXnuTEyeRrZ7Ey1cb-ZLw@mail.gmail.com>
 <193c1173968.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_NwSKEJzbk7RNiOKqU_25f6muydbh0DN+ec1Ke6QrR1Qw@mail.gmail.com>
 <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
 <21a81894-2e1e-440b-b7ea-27660fa08d9d@broadcom.com>
 <CAG17S_O5K4Uh2c6xqph5sUZe8gMjhD3z4FDkSSQ0dhCuZA6aug@mail.gmail.com>
User-Agent: AquaMail/1.54.0 (build: 105400535)
Subject: Re: brcmfmac SAE/WPA3 negotiation
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On December 15, 2024 5:08:12 PM KeithG <ys3al35l@gmail.com> wrote:

> On Sun, Dec 15, 2024 at 6:12 AM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
>>
>> On 12/14/2024 2:34 PM, KeithG wrote:
>>> Arend,
>>>
>>> I looked through the info where I got the latest firmware:
>>> https://community.infineon.com/t5/Wi-Fi-Bluetooth-for-Linux/Wi-Fi-A-class-Linux-Driver-release-FMAC-2024-11-21-Documents/td-p/905045
>>> https://community.infineon.com/t5/AIROC-Wi-Fi-and-Wi-Fi-Bluetooth/Cypress-Linux-WiFi-Driver-Release-FMAC-2024-11-21/td-p/902888
>>> and did not find anything, but I really do not know what I am looking for.
>>
>> I think I had a bit more luck and maybe found the needle. I sent out
>> another RFT patch which hopefully gets rid of the BCME_BADLEN error.
>>
>> Regards,
>> Arend
> Arend,
>
> Can you send me a link to that patch? I want to try it.

Hmm. I explicitly sent it to you, but here is a link to patchwork:

https://patchwork.kernel.org/project/linux-wireless/patch/20241215120401.238320-1-arend.vanspriel@broadcom.com/

You can apply it on top of the other 3 patches.

Regards,
Arend


