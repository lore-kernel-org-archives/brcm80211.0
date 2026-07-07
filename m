Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D763F39CF
	for <brcm80211@lists.linux.dev>; Tue,  7 Jul 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424405; cv=none; b=N+EHMXUTCAtB4FQ1V1Zfq19GZMJ51+0r3pLGLOATcnHVqogkf9yhlqVZJSli1oC6CEXEeIZtY/kcQMM5LSF/HV1/apUfDsjXWEfbTNsAIKhWD0RO9sHrDSVCWYMxeLeybZ1blMNtuHG742s7RzYhnvq24falUwPU1gOfOAUcQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424405; c=relaxed/simple;
	bh=cEM5tecoeARkC6LkrA7ISb4Ad7hdtZ1H7DZvO0w1fTY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=W4VzKKmQKNCJ7FhbhD/MU7ru36apFEKNYzrW0X7a+en1+e5io7MzgnvqKVzriN9ntkZN5KX2QO0o0MySCWuV07IkSn14X2Y31FYl8lM7mfJqc7mvt4mXeZbGIcNLWOWHIiZ679bgvLZgjhlRVoKN5RXOENh8WfauRAQs0gFw2M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ku7q3sOQ; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ku7q3sOQ"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2cacb8416a1so33752565ad.1
        for <brcm80211@lists.linux.dev>; Tue, 07 Jul 2026 04:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783424403; x=1784029203;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cq4FMiWOdMJWiEKvzmRDCBxAiaaOxGrHsyfrfUoaaWM=;
        b=aDdYpA1h7a7wqtemJLTl+pyZ1DDC3l/8cbIpyQWFokpLT247i5vx4q16EwaKwUwllO
         kjev3XRoTVejpGUAL6ssuVLvxenGqDlVvTohFnJAWJMBREyu/n/B29zErgSheZPSXfcR
         r8c3zLJQsiUi9GMK/KJz6HQizw/QDUipaY3RHdQNPCFEDD9stgEbi+5OXT3VZDkcwlyR
         2LVjgdo8cHGod7BGdiPpJKG0gQ10cYhvA6ejEUOfzy8vBaKBTB+xFDjj+EF/aptK8Pep
         hws+XzpYPNlrz+vapg88dBf6hwpjnZJxDweLpQAgUm4JCGm1xMm88LvYdIE3Qr5cz2rP
         Om7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoiOegeGasKq9xRN9SSsw5r+5ptGBjTqKSQGHoYfVvCMC1xwZnyaaEkSG9f6j6iimcXF6mAJ4GV6SA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxL/NaRbciXcBdUAIj7+lofhbMQEyPwwS4KAFpQ/C4FSJaS9E2
	OsIv5eFZbfWeoIAhZQaS1S45DJlfRSIR7sdF5Np82Jek/mUx1TU9Ayb4IyO1Iw3OtL+teSk1S1h
	ahUlam6A1crLiaUOvAbOsJhVSET+Lh1f988LdU2cyROCLswOScr8JZkOWmvQ+JuIgKZqfmDBc0l
	8G5VuKFOkwlpw0EbkPVx17+BBT+loHpQpBaBbsStWLiQo3dgMucVIgfmPetPmqkRUoeYUUcbuTZ
	AIqFfn3GSo+ZCv8oXMrTA==
X-Gm-Gg: AfdE7cl7Gl9IwKxAC8kc9swyz5vU+tThr9J+2+Bw0S5bj5y5d1o/jZGPLRdGJj7FKr/
	pxWdXYtq3nqLH0XC5bc3xgx9r8bJMtVYURAbq1WfPqMRHIb9M/gbKJ+kwApgnY4DdF9Nbl6kV6e
	4hYYz34I9Gq+ViwGAa7S9RHOg8Iqj4RxBph8qj81/GpdEgwYbm3Zm9zeAilRGmz/waie96NQceZ
	K4tJLqKDayKEweEc76fyuvMp4kp9XvjwQGqUJasxL/40w3lgLjxF7dF0jag1j5TDgc2LAHzNYJ7
	D51kMjLiD88f3LcmGc5nESOvm8z0MHs3nTGfHtHT7/Hzk2rP7bIHykQPcgB6gx9G8DIW2xfJFs7
	XnudA/boNmDKo6vGXArY14IwR6M0PGv9tPm+rLoBEz86gAfwm9hxHnbsHESQ4cRuaol/xpYYnCZ
	Um68oQEKUvJ6FlZ2plRC9Sqnzuz8Aw24Y7wN+U9ePS44/9ZSnGRcBI
X-Received: by 2002:a17:902:f64d:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2ccbf056ef2mr48939595ad.25.1783424403203;
        Tue, 07 Jul 2026 04:40:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ccc9bc579asm2118135ad.9.2026.07.07.04.40.02
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jul 2026 04:40:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso51892756d6.2
        for <brcm80211@lists.linux.dev>; Tue, 07 Jul 2026 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783424402; x=1784029202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cq4FMiWOdMJWiEKvzmRDCBxAiaaOxGrHsyfrfUoaaWM=;
        b=Ku7q3sOQG8iV/62B28GjCIhRHxw3RULPpJsybqxdekIls0UE6Xc2Fp5Dsi3KcQ9tf/
         +LYSYeG9kkHR0r7dAxjDu+BojQyEpKsvFJ5ttZt7b4dOLfLZneX6IRABEOE9cS0Y1DuY
         IFHbwXEN2aSEEgL/oSeoBJE38QZ+VVcxON3tI=
X-Forwarded-Encrypted: i=1; AHgh+Rp6hiSyM5JHauqcFoRY9n1iqzx8AaZD3mW/UO40G7TUjdoQJjDuuJpwhvKk6Eluv3m05TVfJ3xIEYc=@lists.linux.dev
X-Received: by 2002:a0c:f114:0:b0:8fd:6df3:b378 with SMTP id 6a1803df08f44-8fd6df3b76bmr14436716d6.60.1783424401652;
        Tue, 07 Jul 2026 04:40:01 -0700 (PDT)
X-Received: by 2002:a0c:f114:0:b0:8fd:6df3:b378 with SMTP id 6a1803df08f44-8fd6df3b76bmr14436076d6.60.1783424401077;
        Tue, 07 Jul 2026 04:40:01 -0700 (PDT)
Received: from [10.176.2.33] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471815818sm159826646d6.31.2026.07.07.04.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 04:40:00 -0700 (PDT)
Message-ID: <996adbdb-9531-49e1-8cae-5fcb7b914d19@broadcom.com>
Date: Tue, 7 Jul 2026 13:40:01 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: brcmfmac: cyw: fix heap overflow on a short auth
 frame
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260707063155.3099999-1-maoyixie.tju@gmail.com>
 <77dfa2f3-296f-470b-8d21-0f10a56a2a4a@broadcom.com>
Content-Language: en-US
In-Reply-To: <77dfa2f3-296f-470b-8d21-0f10a56a2a4a@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 07/07/2026 13:32, Arend van Spriel wrote:
> On 07/07/2026 08:31, Maoyi Xie wrote:
>> brcmf_notify_auth_frame_rx() takes the frame length from the firmware
>> event and copies the frame body with the management header offset
>> subtracted:
>>
>>     u32 mgmt_frame_len = e->datalen - sizeof(struct brcmf_rx_mgmt_data);
>>     ...
>>     memcpy(&mgmt_frame->u, frame,
>>            mgmt_frame_len - offsetof(struct ieee80211_mgmt, u));
>>
>> The only length check is e->datalen >= sizeof(*rxframe), so 
>> mgmt_frame_len
>> can be anything from 0 up. offsetof(struct ieee80211_mgmt, u) is 24. When
>> mgmt_frame_len is below that, the subtraction wraps as an unsigned 
>> value to
>> a huge length. The memcpy then runs far past the kzalloc'd buffer. A
>> malicious or malfunctioning AP can make the frame short during the
>> external SAE auth exchange, so this is a remotely triggered heap 
>> overflow.
>>
>> Reject frames shorter than the management header offset before the copy.
>>
>> Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE 
>> authentication in station mode")
>> Cc: stable@vger.kernel.org
>> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
>> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
>> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
>> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> 
> Thanks. Nothing to add here.

Actually v1 was already applied to the wireless tree.

>> ---
>> v2: drop the Link: tag (Arend), add Arend's Acked-by.
>>
>> v1: https://lore.kernel.org/r/20260627131313.3878893-1- 
>> maoyixie.tju@gmail.com
>>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 6 ++++++
>>   1 file changed, 6 insertions(+)

