Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004509;
	b=ROOd6xKT1MKq5K9udbvrV/DHKmyFCRoDOOKBsNKQ5mbQ+xbjEilRj2YRyN+4jML2eC4F
	 K3GmunKPuzDJ8aKJzKOplcUNDMrBy56FEtXC9GBEnSvla/mbAhpWJLD90TDt/i/VMIc7O
	 Yq3Y6D1dpdL3e0pcTKYirX7ZfypQ4yExvWXBjRvMhVgJQiDnfocLDHeAeUJVMbu5VwcHX
	 GUSVZ3f7QizzCbiDrmfLiCcuex9hrxp3zoKopqDl/9RuH818nQhdmolDAGxyjPemg3Gpa
	 4RxCi9iTj2da0sGCP9VA7rKeNhtvZUCxXzSD6kI1Snei6pcsw2b4/48FwaCCIU4F7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004509;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
	b=KHmZEmFPYtqBomhZanLzfARmPm5oT171LkNTsWjnpFBZa+MYtKGviKdi4giXLWljPQwj
	 rznJ1yFyZrzrK1VAMJJm00huKXssU9u5XHdf+lvq0I8l77jyP4eEyQoxKmS5K6cPqgH3g
	 w538by/+22YSi6DMM7+dQvejwUHtXX0b/NVNQWrfcJZzNwDIECDcrfvYyENjfPUxRPx1o
	 IYlEJLy60jBJr7asXM5skU14k6gcKca7uVnXCZtms4m7MAjtAvXUaQFex7pkrL1egrB2X
	 hIeK8PVTN7CUD2R2t/LJR5wFWlux9Sy9fw1RVkYNOTROmUCE61pPKo/qgFbiDgipx3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CaX3ZR+O;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6CB606A32A
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 12:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6CB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CaX3ZR+O
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso380825a91.1
        for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 04:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004509; x=1795609309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
        b=M98msumOdiAi/MKUHrAnoLy1fXJIaFCpDY7Vy2S+n7wuC/5I9acl0gjoypdm+d04sr
         xiTUriSF/b6uf4Kwm/bbgsV1Kz4Q8BWDMysEPYiGl8v4JTYMmjg/hKji7644KQBO9Rio
         zcrJcuz63Cuyf02oEWdtwFzOP5FIXVwOxX3GCY06YCSULQWxpJ6cHrLZtvYsZWfFBhGd
         mx6+wwy0TZM34ENIlj8PHMcePZabG7r6uIshFr5tD0ZVMAXLrBqqOjY8PK9Rf46hthLi
         WysCujhs6wzGW5+g1y2jNbdIg0rVd1Y5IXiWvAmpK89OFHXPx6qMKf5A39N5cBTtaGgB
         XNrA==
X-Forwarded-Encrypted: i=1; AL+hErEw61Db0cAUgeDgk56RrpIb4+nh/1K7IbJnURxkZoD0jIuwfkCkj86xkZu6hrQeX7roONI9gSPDZUU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9qkVbRZsFZ4Efo8+caH8Eh1E4PRsTqWLgUpR44lV2gF33LxD5d
	fyLlopqVy4LJt8HMFf/mMD1CSXhA3xvioEV+iw5KlPF2F1F89NNJBN8PvEFZf3hzqq/LYzbgbfo
	Sy7TQOLB0lZ8MD/iLce5CNnV5Rl1lc3XiPUPBGvkwoyLHy89uIu4eO0CysdJY42JhvMREBISOOj
	GFQrsfjMi5A1GpWEPeW5d2lgfmPQz7MpnB8DeGp2OPgCHCglOLnoYO6Rv8DwxrH+yQnogk0F6qH
	51hN0lcSvOReOw9O/Lmlg==
X-Gm-Gg: AZFdTZcqJJdq8Nwiu1YuTDspDD/SLHig8ieTe3ym+yVBMXC49hVDpj+qlY33NSeFT1K
	rGrulNt3eRDPgLgz2isO3TM8gp5GKmYm23kzI4HY744xm9JLj/W5sSZvbny/odE3U7ifTQ7RIiT
	vKKSErhh9tL90Wop1VspYpL+wPR1ZUcJJEhzsLOm0iiDnVRZN06PTdH0W/n8UnmaRxZ7T6bMvzJ
	wOj7ZEv/PhAZo5RYapF6zki11r5hX4Qm3mAePjkCA+XTlgXHkX6jAfVjnUp4brulDVkXs9oMsYv
	wVFv9cdFjlKRI0X9EHABaUMd6HtZNdBcjCUwvCD2JFMzUvrLdTba80PvRt26/EeKzBChuAlwTwQ
	oQxTv8PhR6fJFpa7nzxHJlS558fXwWB5Wih8PMF7+QWnC62OUfbHzVzXeC+oR6IK1rTwEu3peT9
	6j/7fG5cVSumFn1iCxKGovNPiMTmHen02+siXqQotH6g==
X-Received: by 2002:a17:90b:4cd0:b0:3ab:f38:2b3c with SMTP id 98e67ed59e1d1-3b3d07b91c7mr2210668a91.28.1795004508639;
        Wed, 18 Nov 2026 04:21:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d435442csm652212a91.4.2026.11.18.04.21.48
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:21:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so173952885a.1
        for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 04:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795004507; x=1795609307; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
        b=CaX3ZR+O7W/ST71m83fqJBss3cDKRgvO6SKbUB9lSYxylbdzYnjzCDnZEHkhR7NypT
         8u9f1UKKOqy0JZPbT0IhkXcCBuvXOU5lUEpWG84qFtCPMwZ7EsCpYk/YdqvKeKlNVkFU
         T5yEy+Jc2XBq8GOCySKqolWhG1HczVJJIX1vc=
X-Forwarded-Encrypted: i=1; AL+hErH1zHGn8rIb4y81QfTG/z1YDd9FRGtdeKUg+GTFGDBoIk0hUlpWThU3Jqn3pwJDAlIVtndGuTLG42E=@lists.linux.dev
X-Received: by 2002:a05:620a:45a2:b0:949:7502:696 with SMTP id af79cd13be357-949996230bdmr468918385a.72.1795004507044;
        Wed, 18 Nov 2026 04:21:47 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:7502:696 with SMTP id af79cd13be357-949996230bdmr468913785a.72.1795004506453;
        Wed, 18 Nov 2026 04:21:46 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b457495sm168164685a.2.2026.11.18.04.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:21:45 -0800 (PST)
Message-ID: <0d8104b6-888f-475a-99e0-0275c12f7a76@broadcom.com>
Date: Wed, 18 Nov 2026 13:21:45 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3
 ACK
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Lukas Klizas <lukas@klizas.lt>,
 Yossef Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
References: <20261104151616.70623-1-dev@deq.rocks>
 <20261116110839.4481-1-arend.vanspriel@broadcom.com>
 <b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
 <20261118125034.4d257b01@kait2en-mbp15-1>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261118125034.4d257b01@kait2en-mbp15-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 18/11/2026 12:50, André Eikmeyer wrote:
> On Tue, 17 Nov 2026 13:12:49 +0100
> Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
> 
> Hi Arend,
> 
>> It is all you ;-) so you can probably confirm whether this is indeed
>> superseded by the series mentioned above. I marked it as such in
>> linux-wireless patchwork.
> 
> Yes, confirmed. Patches 3/5 and 4/5 of the T2 suspend series cover both
> parts of it.
> 
> The same goes for the older "wifi: brcmfmac: handle missing D3 ACK on
> BCM4377 T2 Macs" v2 [1]. With Michael's mailbox over the control ring
> the BCM4377 ACKs D3, so that workaround is not needed anymore and can
> be dropped as well.

Understood. Thanks for the confirmation.

Regards,
Arend
