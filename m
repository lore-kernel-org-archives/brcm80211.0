Received: from mail-oa1-f97.google.com (mail-oa1-f97.google.com [209.85.160.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AF38656A
	for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774694981; cv=none; b=VkvbeF2RG9VjTnQQzGp+EAknAWjVthiQkOUMHK4eem5dgKHYMgvEHW/Z5mxSItfd2ZIWuCqgULUp2N4dwTE0cNeEhSWXOEbxUL6z+v/Ea3fTq1kQ2YfYPPCsa0zH1vOU6jK/gfi5acrh3T8nk7l0IK39xKhO8x5iVSyjtjsk/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774694981; c=relaxed/simple;
	bh=nXo+Z+t9wD8qwriLJvFbxust4+WxxaBdyAGEtQ8SmBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cvz2JOEtY4+HZWD1eDYQeum12xNix1BUb/PvAh28Tyvfw5mQZTLsa6KhuEaXfURP3VCZBJe0KGk+ToBDkTWdDKlU+2qKSrVCfuqKovq30mGk+yURRQ1G+QRlEEbaHIaHnMLDwbz4pnZbzF4oAYN20Rquux8HPaHEzm3rVnOBPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dKGfTx8G; arc=none smtp.client-ip=209.85.160.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dKGfTx8G"
Received: by mail-oa1-f97.google.com with SMTP id 586e51a60fabf-40ef10ec84cso2408190fac.2
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 03:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774694979; x=1775299779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CM66K7bh3C7YvdRkvpH9zwWt4HmV/zowprJjLCrPEpw=;
        b=Injqqs1FDL0OPIZWaxSSyWJrjEXhhiU/YVGDe0dwOrIp4KJ5Ql6KMsBTY+QE7j6LVL
         0HnA6lDoaW9MwCHGR+6F1ke8S0aDHMrlQF2/oa/T5FQIPIaHmbjdQTMl95Zh2staKTVP
         GeJV7RFxIf3IqX93J9u7qKtPDdlgmFfp9YFxYujR9gfjyO3PSRdE5eAQEu8OBRufjPNZ
         Ta3+P42Bws/oHLnHrHqLFhhA1XZZc8YgZxFEK2b1P/ioigFT/z5jBz1C0vjPTuvdMBWS
         iFWnD9pxdO0Fat+QahLuURAL//ci7RhlHUvlmi6Qk1fvO/riGxcIUfPpRTAvsQK5qN6o
         O8OA==
X-Forwarded-Encrypted: i=1; AJvYcCV6HIqWyMnnRkt5I0KtSIwlgEeLxRcLlVnlkP/cS0Nu+j/W7IRg5zr9ncOcAXpKrBMD03FtrUuRM1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNRpa2wTUQQc23ZxRLiDN+6elbAzL3C9fii72amTES7AmIb4Hq
	0NosA5ONdCesrggvNyHJdXQw/6wVjr2DJwCUfT/ehtAGZxx2jMd4C+JExsnxug0Yn4FLzXV4DGj
	Cf9BkRkUS35ey6aSMgGSWHvOiUacPNmhi+qpORo4r7TGYdmtIS2BSacRr+eCq509mzBXsCCKrtG
	Bg1smBRdf69QqAU2iEhbW5XNqs5/Kbo3rTWO3eKHe2MqtLynXy5t+vHHMJCPQeXCNMvicBvQ5lj
	Nnh6x5uZBzbp+uJSr9y6w==
X-Gm-Gg: ATEYQzzUQrN+Go2jyGcZhS/cXjDRsv846mA6LZPDxUWv0RoOG9KV38DNxC+wFmnkq3X
	PwSjYvgRxScV9eYTir013dcfc5vJcUDiAGU+Ko6qmrxQL5wgB+tcKUwmylTret6E31mP5lqizTF
	Fq8xhXgm8Bb1kDisrA94VlYIPfZ2qPj8LFImxXgzrtevBRm66hmgm0epIZcBH6+03BOqqOE1/rf
	32SmETKNzAXerw8F/VFBQ9CRfU+1KV6Gc/VP2+lK4vGZuj832y+frmJm0RReVHHavpsolYWlblt
	J6FW/tqUIRaW9hodySlxH9zc6+LHCuXFkaIGCnahIhLXXQIA8kEa9orL3XVrcF55QVDwbFjXBKu
	Z8V5/lCEpR/F46zd4PBftrYuOUf7k1td8ygvZHufHrvoirISL5m5rbodFP1tbJAYNebfuQz3yqq
	+ILdyhuxr8
X-Received: by 2002:a05:6870:d919:b0:404:1250:1c1f with SMTP id 586e51a60fabf-41cec1f19eemr3216613fac.5.1774694978929;
        Sat, 28 Mar 2026 03:49:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-41d049b1707sm329902fac.4.2026.03.28.03.49.37
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Mar 2026 03:49:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b97fb810dddso362101166b.0
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774694975; x=1775299775; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CM66K7bh3C7YvdRkvpH9zwWt4HmV/zowprJjLCrPEpw=;
        b=dKGfTx8GVKkgFDngvFw7SmwdPJv6iM9N4iWuDtKLy1JSl/Via4OUYKArw0V7duam3R
         MKoNL+5wfZi/jvNVQoDKUltEzbKzXPNTXeJuRnQb7L2D8ePHcu6T1x/rpTk5r9QSwmvn
         QL1KqeKI7TKAyxSbure+Qq9JkQHqwD3qMmfic=
X-Forwarded-Encrypted: i=1; AJvYcCVQXUbYZMgllGRMJKP1dw8DUBt6g31KVDrR4b58q27JupI9b67q6C7/UDYjBA5dUeIo4hOkSYg3Tk8=@lists.linux.dev
X-Received: by 2002:a17:907:3f23:b0:b98:d58:f75e with SMTP id a640c23a62f3a-b9b502ff9damr346053866b.2.1774694974800;
        Sat, 28 Mar 2026 03:49:34 -0700 (PDT)
X-Received: by 2002:a17:907:3f23:b0:b98:d58:f75e with SMTP id a640c23a62f3a-b9b502ff9damr346053066b.2.1774694974172;
        Sat, 28 Mar 2026 03:49:34 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1dda44sm62951266b.43.2026.03.28.03.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 03:49:33 -0700 (PDT)
Message-ID: <c70c306d-a606-42d3-b2f8-7440c34b5f25@broadcom.com>
Date: Sat, 28 Mar 2026 11:49:34 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 wireless-next] wifi: brcmsmac: use FAM for debug code
To: Rosen Penev <rosenp@gmail.com>, Julian Calaby <julian.calaby@gmail.com>
Cc: linux-wireless@vger.kernel.org,
 "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211@lists.linux.dev>,
 "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211-dev-list.pdl@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260309215907.5789-1-rosenp@gmail.com>
 <CAGRGNgUsVxecZobcXvVwmaHD+QHmzp4qTPGSLOpJb6Uinrpa+w@mail.gmail.com>
 <CAKxU2N_i3d2Bkx-35k7COtQ15UATVJja9wrHb8Pp8x9gDnpnBA@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <CAKxU2N_i3d2Bkx-35k7COtQ15UATVJja9wrHb8Pp8x9gDnpnBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/03/2026 02:47, Rosen Penev wrote:
> On Mon, Mar 9, 2026 at 6:11 PM Julian Calaby <julian.calaby@gmail.com> wrote:
>>
>> Hi Arend,
>>
>> On Tue, Mar 10, 2026 at 8:59 AM Rosen Penev <rosenp@gmail.com> wrote:
>>>
>>> Debug code requires a separate allocation to duplicate a string. A FAM
>>> allows properly sized allocation with a single kfree.
>>
>> Sorry Rosen for hijacking your patch here.
>>
>> With these changes, does allocating and copying the string really need
>> to be behind a DEBUG ifdef?
> I don't know. I didn't write this code.

Thanks, Rosen

I did before the concept of FAM landed in the kernel. Whether or not the 
#ifdef DEBUG is warranted is simply a choice. I prefer to have clean 
separation of functionality and the related data. If the code using the 
data is all conditional under DEBUG define then the data must be as well.

I understand that FAM and compiler support for it has its advantages, 
but this is more churn than gain. The code is functional as is and 
removing #defines for the sake of changing to a FAM seems not justified 
for the advantages which in my opinion are pretty limited in this 
particular case.

Regards,
Arend
