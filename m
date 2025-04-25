Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570291F3FC8
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571179; cv=none; b=jTYTMZtKQgpfzNAhCJAL4foCELOBZw+g0k/LrEwqQbk5apBmAqYr6Q2pokX8HScu18WMsuiLjclANdaXz75oronDaWFl3XEx9ka1SSx9dlXqURxha5aiy9aMF21RraiiUDg+G0WD0lVSDIh/O/yKKIuiS5y0BuFH5cChvffPxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571179; c=relaxed/simple;
	bh=wOknFun8vvCNi5rTuhIalm9N1+tTgbVpmOUmbQ1mYEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zl5HjhsJzZmb47k3+93TdY0knD7lMGT6gztRgASVh4JQwoI3j9bXRMFKuOIF2MaZ60UvaArbdffVRHQacN4h7nuzHI1caRfLMp5X+GQiseniQDJ5G0vvtlzxoWRn/TsU6vYAANNY8yd4giXuOLyyXkgKl12oKfnL5lssTYlOrK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aie4CxpB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aie4CxpB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bb647eb23so1674232b3a.0
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745571175; x=1746175975; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F3ijAtwm58urWDhiH+VcJS1gPBR6GMMnfVVS0gX6wiw=;
        b=aie4CxpBa5LQqa1CqFo7mdPkgnqDo9Zp2e3eIpSv20SwNKydKKH3lDFZ25f4oRoVvy
         d8X0REqSVoyRRU1txSbia4uabaeIrhengpBlj54397lMwuC0JOPIK9c+SFAx1V8aw9sE
         ei+mQJ69TOg35tCU7AirmLa39qN5bD1CS2utA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571175; x=1746175975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3ijAtwm58urWDhiH+VcJS1gPBR6GMMnfVVS0gX6wiw=;
        b=cGL4cu55bBR9v5MQLU0bZpMgF+ZBD0sRK8wb/Yr/W7pSGv8qWcO6uqdOpp5pKicdr6
         jEI6X0q+lYE8m0EiwyNhv2b/sMi17x1Kv3rC8Tcf3v/lfXgbdpE6djwj04jSXXCJM8pO
         L2rP+/oN2Hh+cFZwnRfk5U6nUG1l7RvCkr1y2Frdfd1lbR03F26lFdC4ajRbsxTT+/te
         T4Ors4xW8bqrG9JIlSPC5pNllGiyEPerwRG6xQm+OXe5SKpDqsClU5/9kblf5Q4w4pVk
         WJcFvgMCBzj5Uen/cue2KI1RRH9g5WuyjTBZMkTTRO4IBD7Pbz0B41zifsbs+V+eiijO
         3gBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoz67fosDJbJMfULVY0mU0Gf1olPrO9RnTFWH7G4OLSpYl7i/NZ7nyu5ugmG2JGysoHqqH2lELUIQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw80UD8th5HkADUjRe2d0L2hg209gHZBnqGJJfVsa7LJonAlWct
	AD89absqttrqPwvwkn51zojG8Y8d71B1hUNKmBdNAaGmrHqeDpH2NES5V/AS0Q==
X-Gm-Gg: ASbGncu0fx3hHlYIgINWPAumV/hPPJbuEP12lxKIMnne/UBSt9UNtop9DlJiT/wc03n
	H1rK17dX1T6uUX51c988xSqeVe83RXY/lL7Pn6Px644Y0ffPuR1CLQ/Sp8wkgyPAssmoS0G8xUn
	Ye5jp1XNcgsOHq3s7uM1K/dGd5llP4NNhR6XU3X3kbRHMpz4kEe+eCAZR+Vnw2181L1Kdamnx9w
	J4Q1m3Rp+U8qVBux7lPzlVwG92RLydL+A0HYE6xElFpLsXIhJCypqgt1U6gXNAFuzy2/f4fsQjx
	VmOAGWqBMuUijeLiLPCbagvKE9yICEee0SLdOtjf/SWjrvZqtckkZOMAvGWWax/nXhLsrMdV8oU
	q/8+Bli8SkpBx5kROCUYJlWcGVn8=
X-Google-Smtp-Source: AGHT+IESppfwTh+mbIGQfOpE5IHWQQ8kCFI4HqsV9dNdmGPrtsg/CZuAWjzTLsrvQdxNwgQiYyxi7A==
X-Received: by 2002:a05:6a00:194d:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-73fd8e5323fmr2173179b3a.20.1745571175578;
        Fri, 25 Apr 2025 01:52:55 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a3casm2758114b3a.96.2025.04.25.01.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:52:55 -0700 (PDT)
Message-ID: <18407c0c-bf4b-4bcc-b029-831c23a8bbdb@broadcom.com>
Date: Fri, 25 Apr 2025 10:52:49 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 4/4] wifi: brcmfmac: Fix structure size for
 WPA3 external SAE
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 Ting-Ying Li <tingying.li@cypress.com>,
 Ting-Ying Li <tingying.li@infineon.com>, James Prestwood <prestwoj@gmail.com>
References: <20250424194239.2825830-1-arend.vanspriel@broadcom.com>
 <20250424194239.2825830-5-arend.vanspriel@broadcom.com>
 <850b42ab-a637-4dd9-af18-e12523983ded@broadcom.com>
 <44916ff608ee53238d79e57ee31fcbf86dfb672d.camel@sipsolutions.net>
 <95cbaef6-761b-4ecb-a722-a546bb034939@broadcom.com>
 <c03e8384c0c1e338ee9e874780f684d45ce1f1e1.camel@sipsolutions.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <c03e8384c0c1e338ee9e874780f684d45ce1f1e1.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/2025 10:51 AM, Johannes Berg wrote:
> On Fri, 2025-04-25 at 10:49 +0200, Arend van Spriel wrote:
>>
>> Crap. Just sent v2 executing my plan as stated above. v3 or is the
>> mai..eh..custodian willing to fix it up?
>>
> 
> I'd say yes, but honestly I'm not sure I will get around to it today,
> and will likely forget next week. Sorry.

no problem. Expect v3 soon ;-)

Gr. AvS
