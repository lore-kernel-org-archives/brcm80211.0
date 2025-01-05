Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E40DA29
	for <brcm80211@lists.linux.dev>; Sun,  5 Jan 2025 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736109392; cv=none; b=ew6sU+RzFzFhxG1NdHfa3ilhendpgjv885sNd1moiS/U2PZ6nMEHfmmJeKjaWXbPgjYd+Bg2+K2pn71vAwzDbSk46OJfoYX4jOSZPnuy+SsAf4BYZzlfzg0SB9esLU0+aI71DlDsvlKKzmT0Jqobj2qahntqHnfF8zTatKfBuF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736109392; c=relaxed/simple;
	bh=S6PL9azbDLY3+boHvglzcBPv7gzG8yfk1zbtPE3W0Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=os77WvN52n851w0gHXpTX71LcIvh91xNz0K8xFyyHzE6DdSL1ug2wuH6aFBm42TopdEeB0KEJfY5xHuVMObwr02GY5XvkDtTbrrR5CVbVcVuG7R8qgO+G/rjFtR03TlWaHJQvyqJOjZjZpe7anxcP/Qa0uVWyhUqueYt5EhOtNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFoRA6Ul; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFoRA6Ul"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so7563951f8f.0
        for <brcm80211@lists.linux.dev>; Sun, 05 Jan 2025 12:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736109388; x=1736714188; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwH3RZFe2BktFoy07d1gpQ7MnzbeUTFaBLZgq+R0qb8=;
        b=RFoRA6Ulu99Q+yW1ggHQ0oxjNGyfjN8vUOrv6T2zmq0koWRn2ZumnT1niVLtNma7nR
         f26pSfaCkTkMGwoY5VjLPuhZXaxHcxhLim56+YPPhJo/cB4sSWup31ew9h/wTqOi4r2h
         GGr3CmSeaa6GB2VuJGE8PQkkpMJhDuuVkQLPGLVBRJ925pBCfJb5uJwv9mZ7oDEWDkc8
         Pm1mwGZtMQM5w++WabRDAOXLeIY77Ty3sHSABD2pbhzF26gUdr1RZ/EA+pBC2gXuV/JK
         D35wAdgHLAfPqtza4HjgI1BgT90qWn+tLDydQiMVGF03zpmJdtwGZqM9Eq/YHQjsG/Zi
         /vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736109388; x=1736714188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwH3RZFe2BktFoy07d1gpQ7MnzbeUTFaBLZgq+R0qb8=;
        b=MwP40mrinAEDzgo/ZwhyuhHpct2euXhLc6G2DTlGegG2qwkQmAA5alW0ufDwPJmnh0
         VCXmku1xqbBqehZ3qRsy/Wu/7LwxFggsYaFfdJ7/0MLL77nmmbpFVRYeGqHDJmuEnDm7
         /UNLIJI7AktQ+UcOyCgLENr/Q7TrPHpD1xdWD+RYa17+bkBbbsA+k8X9sEKm05JgcE3K
         dddjqrsI7CglE/EfTS5z75qJ1nvLh8DHzomsAb6VRQlPirIaUDw7J7VcXl4pi8Jbp2vb
         kNjocnwkwzaeBBabaEApDFZu9fcadZaD0nG7Gb0VVZTQ02a7c2MBRgdweqCx9ZejHXv6
         XrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU2D3GrHntmTzvM+vsmQ8yk7Zt51bcjDsX90EoXjZ2zzrG9PP0OjgfTtQzQ0YIOYdQkW/RYsvIQ7k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3z4w6682amhm57BkOHB+6A8EGGIUy62xVeAlBwQyi3HuA4VEN
	Bn/n6L2oQ79OAFdqdjKhkP35VKfgkD5Vc/9A8mcs7l2sAVmnE/U=
X-Gm-Gg: ASbGncuuOJN1avYIp/CKxUabgKbqkQ8E36dQviulSXHPQFFYSGdc3GnpQZlEzaHBifQ
	GzaSWnEuanmpxv/nL3UABdGlq7g/xmqOVFpgKQoRv84DAmohoNDu6hJFRvpPKf9kdKLNU5AewHk
	q9Ck7bOAZzIIYQCE33FR8vkVz1ziteSMMVvS3WafizgBc2SFf9fO2Ldi8sySONCz3pzONuE3HWL
	wgtk+jskGF+Hy9HDMz11Ul5mH3hEI72zVR7nwRPwqFu9xMD8QYA1mtayFsOc7tIr/brjrOtVi2M
	hYzDMJvncheeR09Rz54zUvv3Cjs=
X-Google-Smtp-Source: AGHT+IGl1KFrG8GqB0lzghJS7nLNBPOCQzLF3a2WrKlpRdfTmJxuVbGClwL+KJqS99DeDbrFVfsP7w==
X-Received: by 2002:a05:6000:188e:b0:385:f840:e613 with SMTP id ffacd0b85a97d-38a223fd52dmr41095373f8f.51.1736109387181;
        Sun, 05 Jan 2025 12:36:27 -0800 (PST)
Received: from ?IPV6:2a02:810b:f13:8510:e2f9:74c0:93aa:b442? ([2a02:810b:f13:8510:e2f9:74c0:93aa:b442])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8289a0sm47510488f8f.7.2025.01.05.12.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 12:36:26 -0800 (PST)
Message-ID: <3f47bf7d-c8b1-464e-a824-406c4f66ee0a@gmail.com>
Date: Sun, 5 Jan 2025 21:36:25 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: brcmfmac: of: Support interrupts-extended
To: Luca Weiss <luca@lucaweiss.eu>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
References: <20240622215416.659208-1-knaerzche@gmail.com>
 <4660783.LvFx2qVVIh@g550jk>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <4660783.LvFx2qVVIh@g550jk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

> Hi Alex,
>
> On zaterdag 22 juni 2024 23:54:16 Midden-Europese standaardtijd Alex Bee wrote:
>> The currently existing of_property_present check for interrupts does not
>> cover all ways interrupts can be defined in a device tree, e.g.
>> "interrupts-extended".
>>
>> In order to support all current and future ways that can be done, drop that
>> check and call of_irq_parse_one to figure out if an interrupt is defined
>> and irq_create_of_mapping for the actual mapping and let it be handled by
>> the interrupt subsystem.
> This commit seems to break WiFi on qcom/apq8026-asus-sparrow on 6.11.11
> release, and I'm guessing also other apq8026 devices that I have.
>
> dmesg looks like the following on this board:
>
> [   33.699503] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43430-sdio for chip BCM43430/1
> [   33.811445] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43430-sdio.clm_blob failed with error -2
> [   36.565674] brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
> [   36.565725] ieee80211 phy0: brcmf_bus_started: failed: -110
> [   36.565777] ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
> [   36.575930] brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
>
> After reverting this commit it works well again:
>
> [  141.299739] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [  141.355040] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [  141.364695] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> [  141.469042] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43430-sdio for chip BCM43430/1
> [  141.612365] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43430-sdio.clm_blob failed with error -2
> [  141.730597] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
> [  141.730661] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
> [  141.731778] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/1 wl0: Jun 23 2016 21:14:35 version 7.10.324.google.security.test (TOB) (r640416) FWID 01-495ddd98
>
> Would you have a different solution apart from just reverting this commit?


it's very likely that the interrupts are wrongly defined in the device tree

and nobody noticed it yet because the driver didn't pick them up before
this commit.

In particular, looking at qcom-apq8026-asus-sparrow.dts: I would guess that
the IRQ_TYPE_EDGE_FALLING trigger doesn't make much sense if this pinctrl
is set to bias-disable.

You could try changing this to IRQ_TYPE_EDGE_RISING. If changing the IRQ
trigger flag doesn't help, you should check if your board's wifi interrupt
pin is really connected to gpio46.

(Please don't forget to submit a patch if you can fix the problem)

Regards,
Alex

> Regards
> Luca
>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> ---
>> Link to v1:
>> https://lore.kernel.org/all/20240621225558.280462-1-knaerzche@gmail.com/
>>
>>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
>> index e406e11481a6..fe4f65756105 100644
>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
>> @@ -70,6 +70,7 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>>   {
>>   	struct brcmfmac_sdio_pd *sdio = &settings->bus.sdio;
>>   	struct device_node *root, *np = dev->of_node;
>> +	struct of_phandle_args oirq;
>>   	const char *prop;
>>   	int irq;
>>   	int err;
>> @@ -129,10 +130,10 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>>   		sdio->drive_strength = val;
>>   
>>   	/* make sure there are interrupts defined in the node */
>> -	if (!of_property_present(np, "interrupts"))
>> +	if (of_irq_parse_one(np, 0, &oirq))
>>   		return;
>>   
>> -	irq = irq_of_parse_and_map(np, 0);
>> +	irq = irq_create_of_mapping(&oirq);
>>   	if (!irq) {
>>   		brcmf_err("interrupt could not be mapped\n");
>>   		return;
>>
>
>
>
