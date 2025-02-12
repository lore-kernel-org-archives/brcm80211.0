Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDEC20ADE6
	for <brcm80211@lists.linux.dev>; Wed, 12 Feb 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370331; cv=none; b=hzDxRphMyynwnJzahUf8cxHzfz9YF/KrnxjWKp5BoIlbe+M9l4AtZGPGMoKn8Ns9qpNzhfbPlbA8CldBft++Couv1SUSQyELRKnVBWN5lnmzOGLXvftIJVuOOjq/+bxYtfDJ9ax8LHvxrsEgLbpVlIqryTuo0efiaYiL3AwUYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370331; c=relaxed/simple;
	bh=RJMMloWgcQdUFqDSeKQ2oopBz2j77s3iX0H35AhUc2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzhSzUYAxYlVqlqT7BH6gn6ippbszBB4mdx11VKfKwQhcs+nZTp4ygnCnZnRTEziLe1wX/5r5PlSEQBiTdegJzrbf4mT5X08Q3CzOacepvsPBkVvoDQQ5ESkKjEValostVJ1Ap+Pjnti3P8hibMFiQSyUP73dgdzHqUSM7VZpLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSvw2pdR; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSvw2pdR"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-46fa734a0b8so60252001cf.1
        for <brcm80211@lists.linux.dev>; Wed, 12 Feb 2025 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739370327; x=1739975127; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6a2ncZGrEKwYAetWIYfT9wk3W+4dzvqnS2tU96ciDA8=;
        b=XSvw2pdRzThVZeyjCMzx8x3/hItUdwcGqr5f+Fi0QeI3SodP8+5CacUwChZ1U0041M
         KvLi4AqSemjg3cB4ktK/XiJoSTWUPoiGuA3J9QU1YN9LzVnqXG5tDbrNUELZpVr1Z8/A
         4nruLMRfUfbLraoH6Ml0mDx5jP+fXOk/rFIvyT/YUn9kZHcYxE4Xu4EOuSAE6bFyzUOT
         NgRDyF47mUyAjju6gVFicgVfY6e5hQCnZ3rOIjVtPIq42XolFg1HJpLeFabnYbvQCf1K
         3+3ZXIKR2AQ1DQnTysiZLCmqZU735Nayza046GpsZo76gsRe/2MeOr3VOe10JvzVqRfr
         D5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370327; x=1739975127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6a2ncZGrEKwYAetWIYfT9wk3W+4dzvqnS2tU96ciDA8=;
        b=BspWucVUSRWLiqpFesh4bPuSeAFm30mnvE3WvKopOWLcgdEjIfimKwTbZ+rtH6GoHp
         gYidEZZib7QpJixIYukb6bTsLWFK8cxziyXpShroSTv8Fw9rLzTA6FP3fX4bVukSvQlJ
         e2OK7qRNrDO43H3a+AcdixjCoHp0d19iEccw7HRWniPaOcPhl7aAPfhXeMC3yy1WcN4a
         q2g3x3N/5OOQQ0J2xkoAICvgK63e55rmiLNM4pI6/mBP1hdRA5wUvkyv8Lkb1Rk7u65t
         s+43Velxe4PvalKPlSy2HhxWpBVg0dUY9NREHXO96R7S6uOJal0W+nop7eHlWQ7kuW3G
         yySg==
X-Forwarded-Encrypted: i=1; AJvYcCVhqxvHbqOiOOZ8bMjyAQ9MdSH3DJyg2JrXnz1yiNxRwHGvMk9BekM7lkCbk+VaW9E9wduJlnrFcwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYzVeHJ9QURg0/evY9Ij2RiGtJkbYj3yVmMbA/yREDoKOyuHnY
	vHGGe2FGi3ZFmn7RxuzCMQIS/PrJuho6+tJNgzdTu/mrhLinoecq
X-Gm-Gg: ASbGncvZofNTQ8JKtunqjJn2iLUs/+JNj4TB5aEbv6W8D2xxiEvO4zqjg+SvTqZLse3
	75zLCgBo4cKL7GkZPAQwEEhmiZrJ6+JG6h9FRYwNx752oyIo5mgG6x54t6Cud+ao2uSPSshNMsS
	taYP7kZuv0iJrV+BotOsBKTKvaDKnGQyr2DxLUt2b0RJitX5NZbe6yAUYzw8M1dUoJ7ftmRfMC+
	BfA7DXoP17SJGpSezIBmF6bgDylzKYHGa1lAQQcdWgBdbA5PIn7r0UzQRW+NN/b2rzVW4oy/EzK
	qQyLMvoGUUlnw+xZtnE=
X-Google-Smtp-Source: AGHT+IHyy2b5dRkkpIlh970tTduoVTKuBakJRPTRZft3Zijmlwtcmb+LBj3FqVU1FaEqFgpZf0ze2Q==
X-Received: by 2002:a05:622a:180e:b0:471:b9e1:6707 with SMTP id d75a77b69052e-471b9e16e0bmr22457801cf.11.1739370327224;
        Wed, 12 Feb 2025 06:25:27 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471793f639bsm54826191cf.35.2025.02.12.06.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 06:25:26 -0800 (PST)
Message-ID: <e570804d-6835-47da-9c4b-5520b4d6daa7@gmail.com>
Date: Wed, 12 Feb 2025 06:25:24 -0800
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT] brcmfmac: Fix structure size for WPA3 external SAE
To: KeithG <ys3al35l@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 Ting-Ying Li <tingying.li@cypress.com>,
 Ting-Ying Li <tingying.li@infineon.com>
References: <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
 <20241215120401.238320-1-arend.vanspriel@broadcom.com>
 <69874369-495c-4698-af1f-502d21371f7d@gmail.com>
 <CAG17S_Oh7mjecrSju=CxfB5eSqTGewY5gUYqK3YC-oW4jW5G7g@mail.gmail.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <CAG17S_Oh7mjecrSju=CxfB5eSqTGewY5gUYqK3YC-oW4jW5G7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Keith,

On 2/12/25 6:13 AM, KeithG wrote:
> On Wed, Feb 12, 2025 at 7:42 AM James Prestwood <prestwoj@gmail.com> wrote:
>> Hi Arend,
>>
>> On 12/15/24 4:04 AM, Arend van Spriel wrote:
>>> From: Ting-Ying Li <tingying.li@cypress.com>
>>>
>>> Add pmkid parameter in "brcmf_auth_req_status_le" structure to
>>> align the buffer size defined in firmware "wl_auth_req_status"
>>> structure.
>>>
>>> Signed-off-by: Ting-Ying Li <tingying.li@infineon.com>
>>> [arend: adapted path to apply to per-vendor variant]
>>> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>>> ---
>>>    .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h    | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
>>> index 18129adb5dc2..1cbe66526d82 100644
>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
>>> @@ -54,6 +54,7 @@ struct brcmf_auth_req_status_le {
>>>        u8 peer_mac[ETH_ALEN];
>>>        __le32 ssid_len;
>>>        u8 ssid[IEEE80211_MAX_SSID_LEN];
>>> +     u8 pmkid[WLAN_PMKID_LEN];
>>>    };
>>>
>>>    /**
>>>
>>> base-commit: 1cac3bd863bef434d43e6b0554ac5d7f7f6350fe
>>> prerequisite-patch-id: d5b3eb93d54bd6a0508a91f4627ec3e59a810928
>>> prerequisite-patch-id: 653281e1349a038c7f48b3513243f3211fffab9e
>>> prerequisite-patch-id: 0e47ab711ef159237e20c860834d3ac269b05eb2
>> I've tested this and can also confirm it does fix external auth on
>> brcmfmac. I adapted it to work with the upstream 6.6 raspi kernel and
>> had no issues using IWD + external auth to connect to a WPA3 network. Is
>> this something that can be upstreamed?
>>
>> This is the firmware I'm using (no changes to the default raspi distro):
>>
>> Firmware: BCM4345/6 wl0: Aug 29 2023 01:47:08 version 7.45.265 (28bca26
>> CY) FWID 01-b677b91b
>>
>> Thanks,
>>
>> James
>>
> James,
>
> It is easy to do, but I am starting to get confused. Is this in
> addition to or instead of the patch you posted:
> [RFC] netdev: avoid PMKSA for fullmac drivers
This IWD patch is still needed. I'll poke Denis to merge this.
> Does it invalidate the need for using the latest cypress/infineon firmware:
> Firmware: BCM4345/6 wl0: Oct 28 2024 23:27:00 version 7.45.286
> (be70ab3 CY) FWID 01-95efe7fa
I guess? It just worked for me with this kernel patch and the firmware 
that comes stock with raspbian. I haven't tried the latest cypress FW.
>
> If we can go to a default kernel and the 7.45.265 firmware, and still
> have wpa3, that would simplify things and make us happier.
Its not going to work with the default 6.6 kernel (or likely any 
unpatched kernel). You definitely need the above kernel patch adding the 
pmkid field.
>
> Keith
