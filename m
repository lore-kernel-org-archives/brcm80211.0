Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924301;
	b=dAtcunaW42/U0FDShojWxotbKZXGT9OytkOZX0BR6ORIjEsdLh3fhz3FoaLuXATXIDTN
	 OxwIQSTR+AXEgu7sCIrtKXKLwY3wxUYNH97pm6SXBeXnE2GgFPYcbvOMx8RjRwRbBjsMj
	 fe6PEuyOGTJiBeKvOgiOMGBIQPKq1QBlMf/DWFaZk6XrzBwrQT31MjrEEDV8BN6HH81qY
	 hI/hpM9z3yOw/P6W03yiDs1kGmht4fdrujCVF06mh0/L7oRF0BGFe07nf1KSzO+DZwiML
	 OjKLGBLEZrVk3raIWDqxn+cCPjU+kgbkGheYiBa9Ld+zPJDNmSnpyd5y8rSzXDlPd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924301;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
	b=jMZX3mn8kP+GysAujJhBHzrYgXuU+KZiLBTMt5td1A5GCmk6SVDfpNU7aZthYHo9nF8n
	 mR7vPTyhQnQdiCNfzOhTyI1wP/2qO+Yus/gZ00kFqx6R2w2vw0QZUcHQSj7iSB9xjGMxb
	 JjjBSeRHpyhENYu9PwM328hsRyg2ds1114iEyclIVZR7d2kQ4y57CX/Y9vZqQi3xsmTAy
	 A7RO4t5t4hAMg8frZnOzGEMCblLXrNgM21gqOUcBPViIDrrSiQhTrcS+FoRDkk5rIC5If
	 b4Ca3ZKhYnihcG2L5t5IFFUxQeTnTLDOoHfh3s9vxEL7LyGXCrl8rL1oeBYQfOAFz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CtOrNPBD;
	arc=none smtp.remote-ip=74.125.82.97
Received: from mail-dl1-f97.google.com (mail-dl1-f97.google.com [74.125.82.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC127606A330
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 14:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC127606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CtOrNPBD
Received: by mail-dl1-f97.google.com with SMTP id a92af1059eb24-1a3c08d6928so6577135c88.0
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 06:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924300; x=1795529100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
        b=HPO9MYk4XWPbEYwhdsE9O+N79wjQ/wsDMX1OUC+j7smKxpYRei5yxCMbYRF8wKg+1Y
         swf6U9TX5vJVbi1Wa8zQ8JYGNkgoVqCqEaCR44yb3x+O/62vDgDaDWNyAb/nqNGTrgcf
         Nad6ra6yogvKu9267TosQLILLh2hWq9r17P3sJwettp2i2GmE8yGJnjzUUnPlB4T1ltN
         oSyP1uCjPTk1Nibkh9OMHSLT1Z2+8M5RYQBg1iH90ed3qioeV0G+hkdumbrt7Hpw+ThA
         f8ethpy+vd2q5LJfYGTZL6klBOqFCYHZgusT4wovvW7rT6g90eeSWHXpC1+LPXdaFayA
         G/Zw==
X-Gm-Message-State: APuU4Z+6eNTCOdtDOiN180wpT2hRle/s+arfttK8hwSSKq7PwFYb8ccw
	cn2E25NlIs6dDKjMFVuv+QafV+JJLMZV608PULNVMLBa41NaRZOuN+3plbO0Scf7QKighw6nijj
	Lcpql5/O+ZZx24DN+rJBICktoBR4PsLoHMjPQxt+1gNEb7viy8PKRj7iU3laaGj/NS91Xn4sr19
	wGzGWxKLPRVziNTb34VTyeEeXGRNbcqKcvohfecY0Pfkx1mT4A/LWku5f5RsrtFE0u/8ai+0vSY
	L//S4VDqsBzFBU163rQtA==
X-Gm-Gg: AYBFou232adNeCdODgC+7YFcAwogjVtDsrrPHTmVutTsSId58vPGKTQQyDmGSick/HP
	3vWwyB5bet2kCuHo7Xxn0O03HDijnu9w6GqNC6muiXOSmLJtDOV3E5riPvBG8rP+o2oUwmico8o
	6e3MPmjd9lj4UVARrZ+4TGt0o+irjkWboRbAau6gEbDRAdmUuMmfckEtzUVnMvsBn0ZY3NtnP01
	Vd+UM72XAiUrrPWckEhhn1eYEm/i49Zx3qU4KA8oL0lZr8f8ed5WAJHfZi+pDJ3AY6MDYqPWCFI
	0lUGux5mVyynRUhrzBaMhEc5IIzBQ4KRD+GUbYbOoc8cCPP5sKPZVE3GGdLFyAQqvwit3bHiVz8
	zRe68aM5Ridflk26JYXP0VNzF3M1LAw+sV495mxeWv/U4JzmxVaCBlW6vuhHp0HQDEtFWEC5jFj
	bB7/XG7pZ+K1fgrNgdM7+1w5TPPdH0KoKY4zzw89A=
X-Received: by 2002:a05:701a:844a:20b0:1b2:32e1:3bb4 with SMTP id a92af1059eb24-1b51a4896femr9326942c88.18.1794924299269;
        Tue, 17 Nov 2026 06:04:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1b5031933a3sm369022c88.18.2026.11.17.06.04.58
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:04:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf8ea208bso36821875ad.1
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 06:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794924297; x=1795529097; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
        b=CtOrNPBDAX1YGAVBKdp4fnn0sUoey8aOJ8DNZo6JWI7VgPPVd80AxbwNcCaTPkxU+2
         FaZIelH2qixT3M+dMsGe69Po72OOx3phpqMefvTp2GWK/uoCYP1lMLNG3O0koAaIiK22
         TD0N9/9h0dMcqSif8osdMfVGeZX85ULf0Z27M=
X-Received: by 2002:a17:903:22ce:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2ee0dcdaa1emr123675025ad.72.1794924297114;
        Tue, 17 Nov 2026 06:04:57 -0800 (PST)
X-Received: by 2002:a17:903:22ce:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2ee0dcdaa1emr123674805ad.72.1794924296646;
        Tue, 17 Nov 2026 06:04:56 -0800 (PST)
Received: from [10.176.3.187] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db218sm16492325ad.3.2026.11.17.06.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:04:55 -0800 (PST)
Message-ID: <b4ef6564-0e96-43b3-8784-57543ccf8ce7@broadcom.com>
Date: Tue, 17 Nov 2026 15:04:52 +0100
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to
 4-byte boundary
To: Tristan Madani <tristmd@gmail.com>, linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 fariyaf@gmail.com, linville@tuxdriver.com, kvalo@kernel.org,
 linux-kernel@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>,
 stable@vger.kernel.org
References: <20261102122311.181075-1-tristmd@gmail.com>
 <20261102122311.181075-2-tristmd@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261102122311.181075-2-tristmd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/11/2026 13:23, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
> boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
> extra bytes come from heap memory past skb->data, leaking stale kernel
> data to the wireless device.
> 
> Zero-fill the padding before the SDIO write.
> 
> Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")
> Cc: stable@vger.kernel.org

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
>   1 file changed, 3 insertions(+)
